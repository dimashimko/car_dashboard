import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/app_typography.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import '../../../widgets/common/custom_text_field.dart';

class SettingTextField extends StatelessWidget {
  const SettingTextField({
    super.key,
    required this.title,
    required this.initialText,
    this.hintText,
    this.suffixIconPath,
    this.prefixIconPath,
  });

  final String title;
  final String? initialText;
  final String? hintText;
  final String? suffixIconPath;
  final String? prefixIconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.title14m.copyWith(
                  color: colors(context).chatActionButtonIcon,
                ),
              ),
              const Gap(10.0),
              CustomTextField(
                onSubmitMessage: (String value) {},
                initialText: initialText,
                hintText: 'Type $title ...',
                prefixIconPath: prefixIconPath,
                suffixIconPath: suffixIconPath,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
