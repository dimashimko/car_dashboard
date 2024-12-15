import 'package:flutter/material.dart';

class SplashBox extends StatelessWidget {
  const SplashBox({
    super.key,
    this.borderRadius = BorderRadius.zero,
    required this.onTap,
  });

  final BorderRadius borderRadius;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // focusColor: Colors.blue,
          // hoverColor: Colors.green,
          highlightColor: Colors.transparent,
          // splashColor: Colors.transparent,
          onTap: onTap,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
