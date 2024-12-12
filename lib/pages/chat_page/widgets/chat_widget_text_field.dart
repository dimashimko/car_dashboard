import 'dart:developer';

import 'package:car_dashboard/resources/app_fonts.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/theme/custom_theme_extension.dart';

class ChatWidgetTextField extends StatefulWidget {
  const ChatWidgetTextField({super.key, required this.onSubmitMessage});

  final ValueChanged<String> onSubmitMessage;

  @override
  State<ChatWidgetTextField> createState() => _ChatWidgetTextFieldState();
}

class _ChatWidgetTextFieldState extends State<ChatWidgetTextField> {
  final TextEditingController _controller = TextEditingController();
  void _handleSubmit() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSubmitMessage(text);
      log('*** Submitted text: $text');
      _controller.clear();
    } else {
      log('*** TextField is empty.');
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
          onSubmitted: (value) => _handleSubmit(),
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
                onPressed: () {},
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
                onPressed: _handleSubmit,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
