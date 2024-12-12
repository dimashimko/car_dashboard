import 'dart:developer';

import 'package:car_dashboard/pages/messages_page/widgest/contacts/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../models/contact.dart';
import '../../resources/theme/custom_theme_extension.dart';
import '../../router/app_routes.dart';
import '../../utils/constants.dart';
import '../chat_page/widgets/chat_widget.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  Contact? currentContact;

  void onTap({
    required Contact? newContact,
    required bool isNeedPush,
  }) {
    setState(() {
      currentContact = newContact;
    });
    if (isNeedPush) {
      context.push(
        const ChatRoute().location,
        extra: currentContact,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (context, result) {
        log('*** onPopInvokedWithResult MessagesPage');
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                color: colors(context).background,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;

                    if (availableWidth > minWidthForExpandedMessages) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300.0,
                            child: ContactsList(
                              onTap: (newContact) => onTap(
                                newContact: newContact,
                                isNeedPush: false,
                              ),
                            ),
                          ),
                          const Gap(24.0),
                          Expanded(
                            child: ChatWidget(
                              contact: currentContact,
                              isNeedBackButton: false,
                              onTapBackButton: () => onTap(
                                newContact: null,
                                isNeedPush: false,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return currentContact == null
                          ? ContactsList(
                              onTap: (newContact) => onTap(
                                newContact: newContact,
                                isNeedPush: false,
                                // isNeedPush: true,
                              ),
                            )
                          : ChatWidget(
                              contact: currentContact,
                              isNeedBackButton: true,
                              onTapBackButton: () => onTap(
                                newContact: null,
                                isNeedPush: false,
                              ),
                            );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
