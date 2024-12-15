import 'dart:developer';
import 'dart:io';

import 'package:car_dashboard/resources/app_fonts.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../generated/assets.gen.dart';
import '../../../models/message.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/theme/custom_theme_extension.dart';

class ChatWidgetTextField extends StatefulWidget {
  const ChatWidgetTextField({
    super.key,
    required this.onSubmitMessage,
  });

  final ValueChanged<Message> onSubmitMessage;

  @override
  State<ChatWidgetTextField> createState() => _ChatWidgetTextFieldState();
}

class _ChatWidgetTextFieldState extends State<ChatWidgetTextField> {
  final TextEditingController _controller = TextEditingController();

  void _handleSubmitText() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      // widget.onSubmitMessage(text);
      widget.onSubmitMessage(
        Message(
          text: text,
          isMy: true,
          dateTime: DateTime.now(),
          isRead: true,
        ),
      );
      log('*** Submitted text: $text');
      _controller.clear();
    } else {
      log('*** TextField is empty.');
    }
  }

  void _handleSubmitAudio(String audioPath) {
    widget.onSubmitMessage(
      Message(
        text: '',
        audio: audioPath,
        isMy: true,
        dateTime: DateTime.now(),
        isRead: true,
      ),
    );
  }

  Future<String?> pickAndSaveFile() async {
    try {
      // Pick a file
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.single.path != null) {
        File selectedFile = File(result.files.single.path!);

        // Get temporary directory
        Directory tempDir = await getTemporaryDirectory();

        // Define target path in temporary directory
        String tempFilePath = '${tempDir.path}/${result.files.single.name}';

        // Copy the file to the temporary directory
        File tempFile = await selectedFile.copy(tempFilePath);

        // Return the temporary file path
        return tempFile.path;
      } else {
        // User canceled file picking
        return null;
      }
    } catch (e) {
      debugPrint('Error picking or saving file: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: colors(context).messageTextFieldStroke,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 20.0,
      ),
      child: SizedBox(
        height: 50.0,
        child: TextField(
          controller: _controller,
          onSubmitted: (value) => _handleSubmitText(),
          cursorColor: AppColors.searchOrange,
          style: TextStyle(
            color: colors(context).notesStatusBannerText,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: colors(context).messageBackground,
            hoverColor: Colors.transparent,
            disabledBorder: customBorder,
            focusedBorder: customBorder,
            enabledBorder: customBorder,
            border: customBorder,
            contentPadding: EdgeInsets.zero,
            hintText: 'Type Something...',
            hintStyle: AppTypography.title13m.copyWith(
              color: colors(context).messageTextFieldHintText,
              fontWeight: AppFonts.regular,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 4.0,
              ),
              child: IconButton(
                hoverColor:
                    colors(context).messageTextFieldPrefixIcon.withOpacity(0.1),
                icon: Assets.icons.clip.svg(
                  colorFilter: ColorFilter.mode(
                    colors(context).messageTextFieldPrefixIcon,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () async {
                  String? newFile = await pickAndSaveFile();
                  log('*** newFile: ${newFile}');
                  if (newFile != null) {
                    String ext = newFile.split('.').last.toLowerCase();
                    if (['mp3'].contains(ext)) {
                      _handleSubmitAudio(newFile);
                    }
                  }
                },
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
                left: 4.0,
              ),
              child: IconButton(
                hoverColor:
                    colors(context).messageTextFieldPrefixIcon.withOpacity(0.1),
                icon: Assets.icons.sendMessage.svg(),
                onPressed: _handleSubmitText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
