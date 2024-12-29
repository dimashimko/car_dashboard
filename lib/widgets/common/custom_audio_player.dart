import 'dart:io';

import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:car_dashboard/widgets/common/audio_waveform_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_waveform/just_waveform.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../resources/app_fonts.dart';

class AudioPlayerWithWaveform extends StatefulWidget {
  final String audioAsset;

  const AudioPlayerWithWaveform({
    super.key,
    required this.audioAsset,
  });

  @override
  AudioPlayerWithWaveformState createState() => AudioPlayerWithWaveformState();
}

class AudioPlayerWithWaveformState extends State<AudioPlayerWithWaveform> {
  late AudioPlayer _audioPlayer;
  bool _isCompleted = false;
  bool _isPlaying = false;
  int _currentPosition = 0x7FFFFFFFFFFFFFFF;
  // int _currentPosition = 1000000000;

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

    _audioPlayer.positionStream.listen((Duration event) {
      int newCurrentPosition = event.inMilliseconds;
      if (newCurrentPosition == 0) return;
      int difference = newCurrentPosition - _currentPosition;
      if (difference > 100 || difference < 100) {
        setState(() {
          _currentPosition = event.inMilliseconds;
        });
      }
    });

    _audioPlayer.playerStateStream.listen((state) {
      setState(() {
        _isPlaying = state.playing;
        if (state.processingState == ProcessingState.completed) {
          _isCompleted = true;
          _isPlaying = false;
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

                return Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 59.0,
                        child: Builder(builder: (context) {
                          return CustomPaint(
                            painter: AudioWaveformPainter(
                              waveColor: AppColors.primary.purple,
                              waveform: waveform,
                              start: Duration.zero,
                              duration: waveform.duration,
                              currentPosition: _currentPosition,
                              strokeWidth: 2.0,
                              pixelsPerStep: 3.0,
                              scale: 1.0,
                            ),
                          );
                        }),
                      ),
                    ),
                    const Gap(10.0),
                    Text(
                      waveform.duration.toMinutesSeconds(),
                      style: AppTypography.title13m.copyWith(
                        fontWeight: AppFonts.regular,
                        color: AppColors.gray.dark6,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
