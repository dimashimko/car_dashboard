import 'package:car_dashboard/pages/messages_page/widgest/contacts/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/constants.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double availableWidth = constraints.maxWidth;

              if (availableWidth > minWidthForExpandedMessages) {
                return const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContactsList(),
                    Gap(24.0),
                    Placeholder(),
                  ],
                );
              } else {
                return const ContactsList();
              }
            },
          ),
        ),
      ),
    );
  }
}
