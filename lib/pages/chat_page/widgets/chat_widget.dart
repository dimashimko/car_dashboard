import 'package:flutter/material.dart';

import '../../../models/contact.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import 'chat_widget_messages.dart';
import 'chat_widget_title.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.contact,
    required this.isNeedBackButton,
    required this.onTapBackButton,
  });

  final Contact? contact;
  final bool isNeedBackButton;
  final VoidCallback onTapBackButton;

  @override
  Widget build(BuildContext context) {
    if (contact == null) {
      return const Center(
        child: Text(
          'Select the chat',
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: colors(context).chatFrame,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            ChatWidgetTitle(
              contact: contact,
              isNeedBackButton: isNeedBackButton,
              onTapBackButton: onTapBackButton,
            ),
            Expanded(
              child: ChatWidgetMessages(
                contact: contact!,
              ),
            ),
          ],
        ),
      );
    }
  }
}
