import 'dart:developer';

import 'package:car_dashboard/pages/messages_page/widgest/contacts/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.gen.dart';
import '../../models/contact.dart';
import '../../models/message.dart';
import '../../resources/theme/custom_theme_extension.dart';
import '../../utils/constants.dart';
import '../chat_page/widgets/chat_widget.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  int? currentContactId;
  late Contact myContact;

  List<Contact> contacts = [
    Contact(
      id: 1,
      name: 'Killan James',
      avatar: Assets.images.userKillanJames.path,
      // avatar: Assets.images.photo04.path,
      isTyping: true,
      isPinned: true,
      isOnline: true,
      messages: [
        Message(
          text: 'first',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 15, 30, 00),
          isRead: true,
        ),
        Message(
          text: 'second',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 15, 31, 00),
          isRead: true,
        ),
        Message(
          text:
              'Hi, I hope you are doing well, yesterday you have gave a pen This very nice, i am very happy for this.yesterday you have gave a pen This very nice',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 32, 00),
          isRead: true,
        ),
        Message(
          text:
              'yea I’m well, Thank you, i am very happy for this.yesterday you have gave a pen This very nice',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 15, 32, 00),
          isRead: true,
        ),
        Message(
          text:
              'Hi, I hope you are doing well, yesterday you have gave a pen This very nice 😍',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 33, 00),
          isRead: true,
        ),
        Message(
          text:
              ' i am very happy for this.yesterday you have gave a pen This very nice',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 34, 00),
          isRead: false,
        ),
        Message(
          text:
              'yea I’m well, Thank you, i am very happy for this.yesterday you have gave a pen This very nice',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 15, 35, 00),
          isRead: false,
        ),
        Message(
          text: 'no read message 01',
          audio: Assets.audio.voiceMessage,
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 36, 00),
          isRead: false,
        ),
        Message(
          text: 'no read message 02',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 38, 00),
          isRead: false,
        ),
        Message(
          text: '',
          audio: 'assets/audio/elegant_piano.mp3',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 38, 00),
          isRead: false,
        ),
      ],
    ),
    Contact(
      id: 99,
      name: 'Test',
      avatar: Assets.images.photo02.path,
      isTyping: false,
      isPinned: true,
      isOnline: false,
      messages: [
        Message(
          text: '',
          audio: 'assets/audio/audio4.mp3',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 38, 00),
          isRead: false,
        ),
        Message(
          text: '000',
          isMy: true,
          dateTime: DateTime(2023, 12, 12, 11, 42, 00),
          isRead: true,
        ),
        Message(
          text: '001',
          isMy: true,
          dateTime: DateTime(2023, 12, 12, 11, 42, 00),
          isRead: true,
        ),
        Message(
          text: '002',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 09, 36, 00),
          isRead: true,
        ),
        Message(
          text: '003',
          isMy: false,
          dateTime: DateTime(2024, 10, 30, 03, 33, 00),
          isRead: true,
        ),
        Message(
          text: '004',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 09, 36, 00),
          isRead: true,
        ),
        Message(
          text: '005',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 09, 36, 00),
          isRead: true,
        ),
        Message(
          text: '006',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 09, 36, 00),
          isRead: true,
        ),
        Message(
          text: '007',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 09, 36, 00),
          isRead: true,
        ),
        Message(
          text: '008',
          isMy: false,
          dateTime: DateTime(2024, 12, 12, 09, 36, 00),
          isRead: true,
        ),
        Message(
          text: '009',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 09, 36, 00),
          isRead: true,
        ),
        Message(
          text: '010',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 09, 36, 00),
          isRead: true,
        ),
        Message(
          text: '011',
          isMy: true,
          dateTime: DateTime(2024, 12, 12, 09, 37, 00),
          isRead: true,
        ),
      ],
    ),
    Contact(
      id: 2,
      name: 'Desian Tam',
      avatar: Assets.images.userDesianTam.path,
      // avatar: Assets.images.photo02.path,
      isTyping: false,
      isPinned: true,
      isOnline: false,
      messages: [
        Message(
          text: 'Hello! Everyone',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 09, 36, 00),
          isRead: true,
        ),
      ],
    ),
    Contact(
      id: 3,
      name: 'Ahmed Medi',
      avatar: Assets.images.userAhmedMedi.path,
      isTyping: false,
      isPinned: true,
      isOnline: false,
      messages: [
        Message(
          text: 'Wow really Cool 🔥',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 01, 15, 00),
          isRead: true,
        ),
      ],
    ),
    Contact(
      id: 4,
      name: 'Nice',
      avatar: Assets.images.userClaudiaMaudi.path,
      isTyping: false,
      isPinned: false,
      isOnline: false,
      messages: [
        Message(
          text: 'Nice',
          isMy: true,
          dateTime: DateTime(2024, 12, 09, 16, 30, 00),
          isRead: true,
        ),
      ],
    ),
    Contact(
      id: 5,
      name: 'Novita',
      avatar: Assets.images.userNovita.path,
      isTyping: false,
      isPinned: false,
      isOnline: true,
      messages: [
        Message(
          text: 'hi',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 16, 30, 00),
          isRead: false,
        ),
        Message(
          text: 'yah, nice design',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 16, 30, 00),
          isRead: false,
        ),
      ],
    ),
    Contact(
      id: 6,
      name: 'Milie Nose',
      avatar: Assets.images.userMilieNose.path,
      isTyping: false,
      isPinned: false,
      isOnline: true,
      messages: [
        Message(
          text: 'Awesome 🔥',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 16, 30, 00),
          isRead: false,
        ),
      ],
    ),
    Contact(
      id: 7,
      name: 'Ikhsan SD',
      avatar: Assets.images.userIkhsanSd.path,
      isTyping: false,
      isPinned: false,
      isOnline: false,
      messages: [
        Message(
          text: '',
          audio: Assets.audio.voiceMessage,
          isMy: false,
          dateTime: DateTime(2024, 12, 08, 16, 30, 00),
          isRead: true,
        ),
      ],
    ),
    Contact(
      id: 8,
      name: 'Aditya',
      avatar: Assets.images.userAditya.path,
      isTyping: false,
      isPinned: false,
      isOnline: true,
      messages: [
        Message(
          text: 'publish now',
          isMy: false,
          dateTime: DateTime(2024, 12, 08, 15, 30, 00),
          isRead: true,
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    myContact = Contact(
      id: 4,
      name: 'User',
      avatar: Assets.images.photo04.path,
      isTyping: false,
      isPinned: false,
      isOnline: true,
    );
  }

  void onTap({
    required int? newContactId,
  }) {
    setState(() {
      currentContactId = newContactId;
    });
  }

  void onSubmitMessage(Message newMessage) {
    setState(() {
      List<Contact> newListContact = [];
      for (Contact contact in contacts) {
        if (contact.id == currentContactId) {
          List<Message> messages = [
            ...contact.messages,
            newMessage,
          ];
          contact = contact.copyWith(
            messages: messages,
          );
          newListContact.add(contact);
        } else {
          newListContact.add(contact);
        }
      }
      contacts = newListContact;
    });
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
                              contacts: contacts,
                              onTap: (newContact) => onTap(
                                newContactId: newContact,
                              ),
                            ),
                          ),
                          const Gap(24.0),
                          Expanded(
                            child: ChatWidget(
                              contact: contacts
                                  .where((e) => e.id == currentContactId)
                                  .firstOrNull,
                              myContact: myContact,
                              isNeedBackButton: false,
                              onTapBackButton: () => onTap(
                                newContactId: null,
                              ),
                              onSubmitMessage: onSubmitMessage,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return currentContactId == null
                          ? ContactsList(
                              contacts: contacts,
                              onTap: (newContact) => onTap(
                                newContactId: newContact,
                                // isNeedPush: true,
                              ),
                            )
                          : ChatWidget(
                              contact: contacts
                                  .where((e) => e.id == currentContactId)
                                  .firstOrNull,
                              myContact: myContact,
                              isNeedBackButton: true,
                              onTapBackButton: () => onTap(
                                newContactId: null,
                              ),
                              onSubmitMessage: onSubmitMessage,
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
