import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/models/contact.dart';
import 'package:car_dashboard/models/message.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../resources/app_typography.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import '../../../common_pages/home_page/widgets/search_text_field.dart';
import 'contact_card.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
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
          isMy: false,
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
          isRead: true,
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
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 36, 00),
          isRead: true,
        ),
        Message(
          text: 'no read message 02',
          isMy: false,
          dateTime: DateTime(2024, 12, 09, 15, 38, 00),
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
          isRead: false,
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
          isRead: false,
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
          isRead: false,
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
          isRead: false,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: AppTypography.headingH1.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                Assets.icons.pencil.svg(),
              ],
            ),
            const Gap(30.0),
            const SearchTextField(
              hintText: 'Search...',
              prefixIconWidth: 16.0,
            ),
            const Gap(40.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Assets.icons.pushpin.svg(),
                        const Gap(6.0),
                        Text(
                          'PINNED',
                          style: AppTypography.title12m.copyWith(
                            color: AppColors.grayPinnedChats,
                          ),
                        ),
                      ],
                    ),
                    const Gap(16.0),
                    Builder(
                      builder: (context) {
                        List<Contact> listPinned =
                            contacts.where((e) => e.isPinned).toList();
                        return ListView.separated(
                          itemCount: listPinned.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 26.0,
                          ),
                          itemBuilder: (context, index) => ContactCard(
                            contact: listPinned[index],
                          ),
                        );
                      },
                    ),
                    //
                    const Gap(40.0),
                    Row(
                      children: [
                        Assets.icons.messageSmall.svg(),
                        const Gap(6.0),
                        Text(
                          'All Message',
                          style: AppTypography.title12m.copyWith(
                            color: AppColors.grayPinnedChats,
                          ),
                        ),
                      ],
                    ),
                    const Gap(16.0),
                    Builder(
                      builder: (context) {
                        List<Contact> listPinned =
                            contacts.where((e) => !e.isPinned).toList();
                        return ListView.separated(
                          itemCount: listPinned.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 26.0,
                          ),
                          itemBuilder: (context, index) => ContactCard(
                            contact: listPinned[index],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
