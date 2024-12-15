import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/contact.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    this.contact,
  });

  final Contact? contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors(context).background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            // color: colors(context).statisticsTextLabel,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          // child: ChatWidget(
          //   contact: contact,
          //   isNeedBackButton: true,
          // ),
        ),
      ),
    );
  }
}
