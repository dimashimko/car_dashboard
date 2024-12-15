import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Waveforms',
      debugShowCheckedModeBanner: false,
      home: AudioPlayerPage(),
    );
  }
}

// Example Usage
class AudioPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Player')),
      body: Center(
        child: AudioPlayerWithWaveform(
          // audioPath: 'audio/voice_message.mp3',
          audioPath: 'audio/elegant_piano.mp3',
        ),
      ),
    );
  }
}

class AudioPlayerWithWaveform extends StatefulWidget {
  final String audioPath;

  const AudioPlayerWithWaveform({Key? key, required this.audioPath})
      : super(key: key);

  @override
  _AudioPlayerWithWaveformState createState() =>
      _AudioPlayerWithWaveformState();
}

class _AudioPlayerWithWaveformState extends State<AudioPlayerWithWaveform> {
  late AudioPlayer _audioPlayer;
  PlayerState _playerState = PlayerState.stopped;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  List<double> _waveformData = [];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
    _generateWaveformData();
  }

  void _initAudioPlayer() {
    // Listen to audio player state changes
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        _playerState = state;
      });
    });

    // Listen to audio position changes
    _audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _position = position;
      });
    });

    // Get audio duration
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });
  }

  void _generateWaveformData() async {
    // Simulate waveform data generation
    // In a real app, you'd use a waveform generation library or pre-processed data
    final Random random = Random();
    _waveformData = List.generate(100, (_) => random.nextDouble());
  }

  Future<void> _playPause() async {
    if (_playerState == PlayerState.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(widget.audioPath));
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Waveform Visualization
        Container(
          height: 100,
          child: CustomPaint(
            painter: WaveformPainter(_waveformData, _position, _duration),
            child: Container(),
          ),
        ),

        // Play/Pause Button
        IconButton(
          icon: Icon(_playerState == PlayerState.playing
              ? Icons.pause
              : Icons.play_arrow),
          onPressed: _playPause,
          iconSize: 50,
        ),

        // Progress Indicator
        Slider(
          value: _position.inMilliseconds.toDouble(),
          max: _duration.inMilliseconds.toDouble(),
          onChanged: (value) {
            _audioPlayer.seek(Duration(milliseconds: value.toInt()));
          },
        ),

        // Time Display
        Text(
            '${_position.toString().split('.')[0]} / ${_duration.toString().split('.')[0]}'),
      ],
    );
  }
}

class WaveformPainter extends CustomPainter {
  final List<double> waveformData;
  final Duration currentPosition;
  final Duration totalDuration;

  WaveformPainter(this.waveformData, this.currentPosition, this.totalDuration);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    final playedPaint = Paint()
      ..color = Colors.blue.shade700
      ..strokeWidth = 2;

    // Calculate progress percentage
    double progress = totalDuration.inMilliseconds > 0
        ? currentPosition.inMilliseconds / totalDuration.inMilliseconds
        : 0;

    for (int i = 0; i < waveformData.length; i++) {
      double x = (i / waveformData.length) * size.width;
      double barHeight = waveformData[i] * size.height;

      // Determine which paint to use based on progress
      final currentPaint =
          i / waveformData.length <= progress ? playedPaint : paint;

      canvas.drawLine(Offset(x, size.height / 2 - barHeight / 2),
          Offset(x, size.height / 2 + barHeight / 2), currentPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
