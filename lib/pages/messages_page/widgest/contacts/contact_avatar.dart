import 'package:flutter/material.dart';

import '../../../../models/contact.dart';
import 'is_online_indicator.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({
    super.key,
    required this.contact,
    this.isNeedShowStatus = true,
  });

  final Contact contact;
  final bool isNeedShowStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      // color: Colors.orange,
      child: Stack(
        children: [
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Center(
              child: Image.asset(
                contact.avatar,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (isNeedShowStatus && contact.isOnline)
            const Positioned(
              bottom: 3,
              right: 1,
              child: IsOnlineIndicator(),
            ),
        ],
      ),
    );
  }
}
