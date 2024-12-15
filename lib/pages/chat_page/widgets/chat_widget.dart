import 'package:car_dashboard/pages/chat_page/widgets/chat_widget_text_field.dart';
import 'package:flutter/material.dart';

import '../../../models/contact.dart';
import '../../../models/message.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import 'chat_widget_messages.dart';
import 'chat_widget_title.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.contact,
    required this.myContact,
    required this.isNeedBackButton,
    required this.onTapBackButton,
    required this.onSubmitMessage,
  });

  final Contact? contact;
  final Contact myContact;
  final bool isNeedBackButton;
  final VoidCallback onTapBackButton;
  final ValueChanged<Message> onSubmitMessage;

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
                myContact: myContact,
              ),
            ),
            // const Gap(32.0),
            ChatWidgetTextField(
              onSubmitMessage: onSubmitMessage,
            ),
          ],
        ),
      );
    }
  }
}
