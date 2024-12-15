// import 'package:audio_waveforms/audio_waveforms.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
//
// class AudioPlayerWithWaveform extends StatefulWidget {
//   @override
//   _AudioPlayerWithWaveformState createState() =>
//       _AudioPlayerWithWaveformState();
// }
//
// class _AudioPlayerWithWaveformState extends State<AudioPlayerWithWaveform> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   final WaveformController _waveformController = WaveformController();
//
//   bool isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _prepareAudio();
//   }
//
//   Future<void> _prepareAudio() async {
//     // Load audio source
//     await _audioPlayer.setAsset('assets/audio/sample.mp3');
//     // Load waveform data
//     _waveformController.loadAudioFile(
//       audioFile: 'assets/audio/sample.mp3',
//       isAsset: true,
//     );
//   }
//
//   void _togglePlayback() {
//     setState(() {
//       isPlaying = !isPlaying;
//       isPlaying ? _audioPlayer.play() : _audioPlayer.pause();
//     });
//   }
//
//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     _waveformController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio Player with Waveform'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Display audio waveform
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: AudioWaveforms(
//                 waveformController: _waveformController,
//                 size: Size(double.infinity, 200),
//                 waveformType: WaveformType.fitWidth,
//                 showActiveWaveform: true,
//                 activeWaveformColor: Colors.blue,
//                 inactiveWaveformColor: Colors.grey,
//               ),
//             ),
//           ),
//           // Playback controls
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(
//                   isPlaying ? Icons.pause : Icons.play_arrow,
//                   size: 48,
//                 ),
//                 onPressed: _togglePlayback,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: AudioPlayerWithWaveform(),
//   ));
// }
