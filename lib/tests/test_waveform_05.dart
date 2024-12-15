import 'package:audio_waveforms/audio_waveforms.dart';
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

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final PlayerController playerController = PlayerController();

  @override
  void initState() {
    super.initState();
  }

  void prepare() async {
    // File file = File('${appDirectory.path}/audio.mp3');
    // final audioFile = await rootBundle.load('assets/audio.mp3');
    // await file.writeAsBytes(audioFile.buffer.asUint8List());
    // playerController.preparePlayer(path: file.path);

    playerController.preparePlayer(
      // audioPath: 'audio/voice_message.mp3',
      // audioPath: 'audio/elegant_piano.mp3',
      // path: '../myFile.mp3',
      path: 'audio/voice_message.mp3',
    );
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            playerController.startPlayer();
          },
          child: Text('play'),
        ),
        ElevatedButton(
          onPressed: () {
            playerController.pausePlayer();
          },
          child: Text('pause'),
        ),
        ElevatedButton(
          onPressed: () {
            playerController.stopPlayer();
          },
          child: Text('Stop'),
        ),
        AudioFileWaveforms(
          playerController: playerController,
          size: Size(300, 50),
        ),
      ],
    );
  }
}
