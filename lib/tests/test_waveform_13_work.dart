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
  bool _isCompleted = false;

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
          setState(() {
            _isCompleted = true;
          });
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

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 32.0,
              ),
              onPressed: () async {
                if (isPlaying) {
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
