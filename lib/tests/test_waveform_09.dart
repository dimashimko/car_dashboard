import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_waveform/just_waveform.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Audio Waveforms',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: AudioPlayerWithWaveform(
            audioFileName: 'audio1',
          ),
        ),
      ),
    );
  }
}

class AudioPlayerWithWaveform extends StatefulWidget {
  final String audioFileName;

  const AudioPlayerWithWaveform({
    Key? key,
    required this.audioFileName,
  }) : super(key: key);

  @override
  _AudioPlayerWithWaveformState createState() =>
      _AudioPlayerWithWaveformState();
}

class _AudioPlayerWithWaveformState extends State<AudioPlayerWithWaveform> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final BehaviorSubject<WaveformProgress> _progressStream =
      BehaviorSubject<WaveformProgress>();
  bool _isPlaying = false;
  late File _waveformFile;

  @override
  void initState() {
    super.initState();
    _initAudioWaveform();
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  Future<void> _initAudioWaveform() async {
    final tempDir = await getTemporaryDirectory();
    final audioFile = File('${tempDir.path}/${widget.audioFileName}.mp3');

    // Load audio asset to temporary file
    await audioFile.writeAsBytes(
        (await rootBundle.load('assets/audio/${widget.audioFileName}.mp3'))
            .buffer
            .asUint8List());

    _waveformFile = File('${tempDir.path}/${widget.audioFileName}.wave');

    // Generate waveform
    JustWaveform.extract(
      audioInFile: audioFile,
      waveOutFile: _waveformFile,
    ).listen(
      _progressStream.add,
      onError: _progressStream.addError,
    );
  }

  void _togglePlayPause() async {
    final audioFile = File(
        '${(await getTemporaryDirectory()).path}/${widget.audioFileName}.mp3');
    if (await audioFile.exists()) {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(UrlSource(audioFile.path));
      }
      setState(() {
        _isPlaying = !_isPlaying;
      });
    } else {
      print('Audio file not found: ${audioFile.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: _togglePlayPause,
        ),
        Expanded(
          child: StreamBuilder<WaveformProgress>(
            stream: _progressStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final progress = snapshot.data?.progress ?? 0.0;
              final waveform = snapshot.data?.waveform;

              if (waveform == null) {
                return Center(child: Text('${(100 * progress).toInt()}%'));
              }

              return AudioWaveformWidget(
                waveform: waveform,
                start: Duration.zero,
                duration: waveform.duration,
                waveColor: Colors.blue,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _progressStream.close();
    super.dispose();
  }
}

class AudioWaveformWidget extends StatelessWidget {
  final Waveform waveform;
  final Duration start;
  final Duration duration;
  final Color waveColor;

  const AudioWaveformWidget({
    Key? key,
    required this.waveform,
    required this.start,
    required this.duration,
    this.waveColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AudioWaveformPainter(
        waveform: waveform,
        start: start,
        duration: duration,
        waveColor: waveColor,
      ),
    );
  }
}

class AudioWaveformPainter extends CustomPainter {
  final Waveform waveform;
  final Duration start;
  final Duration duration;
  final Color waveColor;

  AudioWaveformPainter({
    required this.waveform,
    required this.start,
    required this.duration,
    required this.waveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint waveform logic as defined earlier
  }

  @override
  bool shouldRepaint(covariant AudioWaveformPainter oldDelegate) {
    return false;
  }
}
