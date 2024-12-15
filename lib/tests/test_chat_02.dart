import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MultiMediaChatApp());
}

class MultiMediaChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multimedia Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatMessage {
  final String text;
  final MessageType type;
  final String? filePath;
  final bool isMe;

  ChatMessage({
    required this.text,
    required this.type,
    this.filePath,
    required this.isMe,
  });
}

enum MessageType { text, image, video, audio, file }

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ImagePicker _imagePicker = ImagePicker();

  // final Record _audioRecorder = Record();
  bool _isRecording = false;
  String? _recordedAudioPath;

  void _sendMessage(
      {String? text, MessageType type = MessageType.text, String? filePath}) {
    if ((text != null && text.isNotEmpty) || filePath != null) {
      setState(() {
        _messages.add(
          ChatMessage(
            text: text ?? '',
            type: type,
            filePath: filePath,
            isMe: true,
          ),
        );
        _textController.clear();
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      _sendMessage(
        text: 'Image',
        type: source == ImageSource.camera
            ? MessageType.image
            : MessageType.image,
        filePath: pickedFile.path,
      );
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      _sendMessage(
        text: result.files.single.name,
        type: _getFileType(file),
        filePath: file.path,
      );
    }
  }

  MessageType _getFileType(File file) {
    String ext = file.path.split('.').last.toLowerCase();
    if (['mp4', 'avi', 'mov'].contains(ext)) return MessageType.video;
    if (['mp3', 'wav', 'ogg'].contains(ext)) return MessageType.audio;
    return MessageType.file;
  }

  Future<void> _startRecording() async {
    // if (await _audioRecorder.hasPermission()) {
    //   await _audioRecorder.start(
    //     path: '/path/to/audio/recording.m4a',
    //     encoder: AudioEncoder.aacLc,
    //   );
    //   setState(() {
    //     _isRecording = true;
    //   });
    // }
  }

  Future<void> _stopRecording() async {
    // _recordedAudioPath = await _audioRecorder.stop();
    // setState(() {
    //   _isRecording = false;
    // });
    //
    // if (_recordedAudioPath != null) {
    //   _sendMessage(
    //     text: 'Audio Recording',
    //     type: MessageType.audio,
    //     filePath: _recordedAudioPath,
    //   );
    // }
  }

  Widget _buildMessageItem(ChatMessage message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Text message
          if (message.type == MessageType.text)
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: message.isMe ? Colors.blue[100] : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message.text),
            ),

          // Image message
          if (message.type == MessageType.image && message.filePath != null)
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: FileImage(File(message.filePath!)),
                  fit: BoxFit.cover,
                ),
              ),
            ),

          // Audio message
          if (message.type == MessageType.audio)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.audiotrack, color: Colors.blue),
                Text('Audio Recording'),
              ],
            ),

          // File message
          if (message.type == MessageType.file)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.insert_drive_file, color: Colors.grey),
                Text(message.text),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multimedia Chat'),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageItem(_messages[index]);
              },
            ),
          ),

          // Input area
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                // Text input
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                // Send text button
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(text: _textController.text),
                ),

                // Media buttons
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: _pickFile,
                ),
                // Audio recording
                GestureDetector(
                  onLongPressStart: (_) => _startRecording(),
                  onLongPressEnd: (_) => _stopRecording(),
                  child: Icon(_isRecording ? Icons.stop : Icons.mic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
