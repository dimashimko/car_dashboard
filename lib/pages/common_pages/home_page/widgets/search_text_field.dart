import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.hintText = ' Search or type',
    this.prefixIconWidth = 20.0,
  });

  final String hintText;
  final double prefixIconWidth;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.searchOrange,
      decoration: InputDecoration(
        filled: true,
        fillColor: colors(context).searchBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.zero,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 16,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Assets.icons.search.svg(
              width: prefixIconWidth,
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 50.0,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppColors.gray.dark4,
        ),
      ),
    );
  }
}
