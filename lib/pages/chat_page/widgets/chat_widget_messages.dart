import 'package:car_dashboard/models/message.dart';
import 'package:flutter/material.dart';

import '../../../models/contact.dart';
import 'message_card.dart';

class ChatWidgetMessages extends StatelessWidget {
  const ChatWidgetMessages({
    super.key,
    required this.contact,
    required this.myContact,
  });

  final Contact contact;
  final Contact myContact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Builder(builder: (context) {
        List<Message> messages = contact.messages;
        return ListView.separated(
          reverse: true,
          itemCount: messages.length,
          separatorBuilder: (_, __) => const SizedBox(
            height: 12.0,
          ),
          itemBuilder: (context, reverseIndex) {
            int index = messages.length - 1 - reverseIndex;
            bool isFirstInGroup = index == 0
                ? true
                : (messages[index].isMy != messages[index - 1].isMy)
                    ? true
                    : false;
            bool isLastInGroup = index == messages.length - 1
                ? true
                : (messages[index].isMy != messages[index + 1].isMy)
                    ? true
                    : false;
            return MessageCard(
              message: messages[index],
              isFirstInGroup: isFirstInGroup,
              isLastInGroup: isLastInGroup,
              contact: contact,
              myContact: myContact,
            );
          },
        );
      }),
    );
  }
}
