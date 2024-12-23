import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:car_dashboard/tests/test_waveform_07_original.dart';
import 'package:flutter/material.dart';
import 'package:just_waveform/just_waveform.dart';
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
            audioFilePath: 'assets/audio/audio1.mp3',
            // 'assets/audio/audio1.mp3',
          ),
        ),
      ),
    );
  }
}

class AudioPlayerWithWaveform extends StatefulWidget {
  final String audioFilePath;

  const AudioPlayerWithWaveform({
    Key? key,
    required this.audioFilePath,
  }) : super(key: key);

  @override
  State<AudioPlayerWithWaveform> createState() =>
      _AudioPlayerWithWaveformState();
}

class _AudioPlayerWithWaveformState extends State<AudioPlayerWithWaveform> {
  final progressStream = BehaviorSubject<WaveformProgress>();
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initWaveform();
    _initAudioPlayer();
  }

  Future<void> _initWaveform() async {
    final audioFile = File(widget.audioFilePath);
    final waveFile = File('${widget.audioFilePath}.wave');

    try {
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

  Future<void> _initAudioPlayer() async {
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  Future<void> _playPause() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(DeviceFileSource(widget.audioFilePath));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Play/Pause button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
              iconSize: 48,
              onPressed: _playPause,
            ),
          ),
          // Waveform
          Expanded(
            child: StreamBuilder<WaveformProgress>(
              stream: progressStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                final waveform = snapshot.data?.waveform;
                if (waveform == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return AudioWaveformWidget(
                  waveColor: Colors.orange,
                  waveform: waveform,
                  start: Duration.zero,
                  duration: waveform.duration,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    progressStream.close();
    super.dispose();
  }
}
