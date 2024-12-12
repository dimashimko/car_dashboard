import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/theme/custom_theme_extension.dart';
import '../../../widgets/uncategorized/splash_box.dart';

class ChatAction extends StatelessWidget {
  const ChatAction({
    super.key,
    required this.iconPath,
    required this.onTap,
  });

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 44.0,
          height: 44.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors(context).chatActionButtonBackground,
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                colors(context).chatActionButtonIcon,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        SplashBox(
          borderRadius: BorderRadius.circular(22.0),
          onTap: onTap,
        ),
      ],
    );
  }
}
