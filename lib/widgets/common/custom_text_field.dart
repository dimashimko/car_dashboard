import 'dart:developer';

import 'package:car_dashboard/resources/app_fonts.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/theme/custom_theme_extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.onSubmitMessage,
    required this.initialText,
    this.hintText,
    this.prefixIconPath,
    this.suffixIconPath,
  });

  final ValueChanged<String> onSubmitMessage;
  final String? initialText;
  final String? hintText;
  final String? prefixIconPath;
  final String? suffixIconPath;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialText ?? "",
    );
  }

  void _handleSubmitText() {
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

    return SizedBox(
      height: 48.0,
      child: TextField(
        controller: _controller,
        onSubmitted: (value) => _handleSubmitText(),
        cursorColor: AppColors.searchOrange,
        style: TextStyle(
          color: colors(context).notesStatusBannerText,
        ),
        decoration: InputDecoration(
          hoverColor: Colors.transparent,
          disabledBorder: customBorder,
          focusedBorder: customBorder,
          enabledBorder: customBorder,
          border: customBorder,
          contentPadding: EdgeInsets.zero,
          hintText: widget.hintText ?? 'Type Something...',
          hintStyle: AppTypography.title13m.copyWith(
            color: colors(context).messageTextFieldHintText,
            fontWeight: AppFonts.regular,
          ),
          prefixIconConstraints: BoxConstraints(),
          prefixIcon: widget.prefixIconPath == null
              ? SizedBox(
                  width: 16.0,
                )
              // ? null
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 14.0,
                    right: 10.0,
                  ),
                  child: SvgPicture.asset(
                    widget.prefixIconPath!,
                  ),
                ),
          suffixIcon: widget.suffixIconPath == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                    left: 4.0,
                  ),
                  child: IconButton(
                    hoverColor: colors(context)
                        .messageTextFieldPrefixIcon
                        .withOpacity(0.1),
                    icon: SvgPicture.asset(
                      widget.suffixIconPath!,
                    ),
                    onPressed: () {},
                  ),
                ),
        ),
      ),
    );
  }
}
