import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Audio Player Example',
          ),
        ),
        body: const Center(
          child: AudioPlayerWidget(
            audioAsset: 'assets/audio/elegant_piano.mp3',
          ),
        ),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final String audioAsset;

  const AudioPlayerWidget({Key? key, required this.audioAsset})
      : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      await _audioPlayer.setAsset(widget.audioAsset);
      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          // When the track ends, stop it and reset to start
          _audioPlayer.stop();
        }
      });
    } catch (e) {
      debugPrint('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: _audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final isPlaying = playerState?.playing ?? false;
        final processingState = playerState?.processingState;

        // Check if the player is completed
        final isCompleted = processingState == ProcessingState.completed;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isPlaying && !isCompleted ? Icons.pause : Icons.play_arrow,
                size: 32.0,
              ),
              onPressed: () async {
                if (isPlaying) {
                  // Pause the track if it's playing
                  await _audioPlayer.pause();
                } else {
                  if (isCompleted) {
                    // Restart the track from the beginning
                    await _audioPlayer.seek(Duration.zero);
                  }
                  // Play the track
                  await _audioPlayer.play();
                }
              },
            ),
            const SizedBox(width: 8.0),
            const Text(
              'Audio Player',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        );
      },
    );
  }
}
