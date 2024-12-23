import 'dart:io';
import 'dart:math';

import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_waveform/just_waveform.dart';
import "package:path/path.dart" as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player with Waveform',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Audio Player with Waveform'),
        ),
        body: const Center(
          child: AudioPlayerWithWaveform(
            audioAsset: 'assets/audio/elegant_piano.mp3',
            // audioAsset: 'assets/audio/audio2.mp3',
            // audioAsset: 'assets/audio/audio3.mp3',
            // audioAsset: 'assets/audio/audio4.mp3',
          ),
        ),
      ),
    );
  }
}

class AudioPlayerWithWaveform extends StatefulWidget {
  final String audioAsset;

  const AudioPlayerWithWaveform({
    super.key,
    required this.audioAsset,
  });

  @override
  _AudioPlayerWithWaveformState createState() =>
      _AudioPlayerWithWaveformState();
}

class _AudioPlayerWithWaveformState extends State<AudioPlayerWithWaveform> {
  late AudioPlayer _audioPlayer;
  bool _isCompleted = false;
  bool _isPlaying = false; // Track playing state

  final progressStream = BehaviorSubject<WaveformProgress>();

  // final String fileName = 'elegant_piano';
  late final String fileName;

  @override
  void initState() {
    super.initState();
    fileName = widget.audioAsset.split('/').last.split('.').first;

    _audioPlayer = AudioPlayer();
    _loadAudio();
    _init();

    // Listen to player state changes to update the button state
    _audioPlayer.playerStateStream.listen((state) {
      setState(() {
        _isPlaying = state.playing;
        if (state.processingState == ProcessingState.completed) {
          _isCompleted = true;
          _isPlaying = false; // Reset to false when audio completes
        }
      });
    });
  }

  Future<void> _loadAudio() async {
    try {
      await _audioPlayer.setAsset(widget.audioAsset);
    } catch (e) {
      debugPrint('Error loading audio: $e');
    }
  }

  Future<void> _init() async {
    final audioFile = File(
      p.join(
        (await getTemporaryDirectory()).path,
        '$fileName.mp3',
      ),
    );
    try {
      await audioFile.writeAsBytes((await rootBundle.load(
        'assets/audio/$fileName.mp3',
      ))
          .buffer
          .asUint8List());
      final waveFile = File(
        p.join(
          (await getTemporaryDirectory()).path,
          '$fileName.wave',
        ),
      );
      JustWaveform.extract(
        audioInFile: audioFile,
        waveOutFile: waveFile,
      ).listen(
        progressStream.add,
        onError: progressStream.addError,
      );
    } catch (e) {
      progressStream.addError(e);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    progressStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Play/Pause Button
        Container(
          height: 39.0,
          width: 39.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.purple,
          ),
          child: InkWell(
            child: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 24.0,
              color: AppColors.white,
            ),
            onTap: () async {
              if (_isPlaying) {
                await _audioPlayer.pause();
              } else {
                if (_isCompleted) {
                  await _audioPlayer.seek(Duration.zero);
                  setState(() {
                    _isCompleted = false;
                  });
                }
                await _audioPlayer.play();
              }
            },
          ),
        ),
        const Gap(10.0),
        Expanded(
          child: SizedBox(
            height: 59.0,
            child: StreamBuilder<WaveformProgress>(
              stream: progressStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                final progress = snapshot.data?.progress ?? 0.0;
                final waveform = snapshot.data?.waveform;
                if (waveform == null) {
                  return Center(
                    child: Text(
                      '${(100 * progress).toInt()}%',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                }
                return AudioWaveformWidget(
                  waveColor: AppColors.primary.purple,
                  waveform: waveform,
                  start: Duration.zero,
                  duration: waveform.duration,
                  strokeWidth: 2.0,
                  pixelsPerStep: 3.0,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AudioWaveformWidget extends StatefulWidget {
  final Color waveColor;
  final double scale;
  final double strokeWidth;
  final double pixelsPerStep;
  final Waveform waveform;
  final Duration start;
  final Duration duration;

  const AudioWaveformWidget({
    super.key,
    required this.waveform,
    required this.start,
    required this.duration,
    this.waveColor = Colors.blue,
    this.scale = 1.0,
    this.strokeWidth = 5.0,
    this.pixelsPerStep = 8.0,
  });

  @override
  _AudioWaveformState createState() => _AudioWaveformState();
}

class _AudioWaveformState extends State<AudioWaveformWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: AudioWaveformPainter(
          waveColor: widget.waveColor,
          waveform: widget.waveform,
          start: widget.start,
          duration: widget.duration,
          scale: widget.scale,
          strokeWidth: widget.strokeWidth,
          pixelsPerStep: widget.pixelsPerStep,
        ),
      ),
    );
  }
}

class AudioWaveformPainter extends CustomPainter {
  final double scale;
  final double strokeWidth;
  final double pixelsPerStep;
  final Paint wavePaint;
  final Waveform waveform;
  final Duration start;
  final Duration duration;

  AudioWaveformPainter({
    required this.waveform,
    required this.start,
    required this.duration,
    Color waveColor = Colors.blue,
    this.scale = 1.0,
    this.strokeWidth = 5.0,
    this.pixelsPerStep = 8.0,
  }) : wavePaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..color = waveColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (duration == Duration.zero) return;

    double width = size.width;
    double height = size.height;

    final waveformPixelsPerWindow = waveform.positionToPixel(duration).toInt();
    final waveformPixelsPerDevicePixel = waveformPixelsPerWindow / width;
    final waveformPixelsPerStep = waveformPixelsPerDevicePixel * pixelsPerStep;
    final sampleOffset = waveform.positionToPixel(start);
    final sampleStart = -sampleOffset % waveformPixelsPerStep;
    for (var i = sampleStart.toDouble();
        i <= waveformPixelsPerWindow + 1.0;
        i += waveformPixelsPerStep) {
      final sampleIdx = (sampleOffset + i).toInt();
      final x = i / waveformPixelsPerDevicePixel;
      final minY = normalise(waveform.getPixelMin(sampleIdx), height);
      final maxY = normalise(waveform.getPixelMax(sampleIdx), height);
      canvas.drawLine(
        Offset(x + strokeWidth / 2, max(strokeWidth * 0.75, minY)),
        Offset(x + strokeWidth / 2, min(height - strokeWidth * 0.75, maxY)),
        wavePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant AudioWaveformPainter oldDelegate) {
    return false;
  }

  double normalise(int s, double height) {
    if (waveform.flags == 0) {
      final y = 32768 + (scale * s).clamp(-32768.0, 32767.0).toDouble();
      return height - 1 - y * height / 65536;
    } else {
      final y = 128 + (scale * s).clamp(-128.0, 127.0).toDouble();
      return height - 1 - y * height / 256;
    }
  }
}
