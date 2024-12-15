// import 'dart:io';
//
// import 'package:audio_waveforms/audio_waveforms.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class RealAudioWaveformPlayer extends StatefulWidget {
//   const RealAudioWaveformPlayer({Key? key}) : super(key: key);
//
//   @override
//   _RealAudioWaveformPlayerState createState() =>
//       _RealAudioWaveformPlayerState();
// }
//
// class _RealAudioWaveformPlayerState extends State<RealAudioWaveformPlayer> {
//   late AudioRecorder audioRecorder;
//   late RecorderController recorderController;
//   late PlayerController playerController;
//
//   String? path;
//   bool isRecording = false;
//   bool isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initialiseControllers();
//   }
//
//   void _initialiseControllers() {
//     recorderController = RecorderController(
//       amplitudeSamples: 100,
//       encoder: AudioEncoder.aac,
//       sampleRate: 44100,
//     );
//
//     playerController = PlayerController();
//     audioRecorder = AudioRecorder();
//   }
//
//   Future<void> _startRecording() async {
//     // Request microphone permission
//     if (await Permission.microphone.request().isGranted) {
//       // Generate a path for the recording
//       final directory = Platform.isAndroid
//           ? await getExternalStorageDirectory()
//           : await getApplicationDocumentsDirectory();
//
//       path = '${directory!.path}/audio_recording.m4a';
//
//       // Start recording
//       await recorderController.record(path: path!);
//
//       setState(() {
//         isRecording = true;
//       });
//     }
//   }
//
//   Future<void> _stopRecording() async {
//     final recordedPath = await recorderController.stop();
//
//     setState(() {
//       isRecording = false;
//       path = recordedPath;
//     });
//
//     // Generate waveform data
//     await playerController.preparePlayer(
//       path: path!,
//       shouldExtractWaveform: true,
//       noOfSamples: Platform.isIOS ? 100 : 50,
//     );
//   }
//
//   Future<void> _playPause() async {
//     if (path == null) return;
//
//     if (isPlaying) {
//       await playerController.pausePlayer();
//       setState(() {
//         isPlaying = false;
//       });
//     } else {
//       await playerController.startPlayer(
//         finishMode: FinishMode.stop,
//         fromPosition: Duration.zero,
//       );
//       setState(() {
//         isPlaying = true;
//       });
//
//       // Listen for player completion
//       playerController.onCompletion.listen((_) {
//         setState(() {
//           isPlaying = false;
//         });
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     recorderController.dispose();
//     playerController.dispose();
//     audioRecorder.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Audio Waveform Recorder')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Waveform Display
//             AudioFileWaveforms(
//               size: Size(MediaQuery.of(context).size.width * 0.9, 100),
//               playerController: playerController,
//               animationCurve: Curves.easeInOut,
//               enableSeekGesture: true,
//               waveformType: WaveformType.fitWidth,
//             ),
//
//             SizedBox(height: 20),
//
//             // Control Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Record Button
//                 IconButton(
//                   icon: Icon(
//                     isRecording ? Icons.stop : Icons.mic,
//                     color: isRecording ? Colors.red : Colors.blue,
//                     size: 50,
//                   ),
//                   onPressed: isRecording ? _stopRecording : _startRecording,
//                 ),
//
//                 // Play/Pause Button
//                 if (path != null)
//                   IconButton(
//                     icon: Icon(
//                       isPlaying ? Icons.pause : Icons.play_arrow,
//                       size: 50,
//                     ),
//                     onPressed: _playPause,
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Add these to pubspec.yaml
// /*
// dependencies:
//   flutter:
//     sdk: flutter
//   audio_waveforms: ^1.0.4
//   permission_handler: ^11.0.1
//
// # Don't forget to add platform-specific configurations
// */
