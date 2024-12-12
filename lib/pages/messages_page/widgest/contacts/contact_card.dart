import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/contact.dart';
import '../../../../resources/app_colors.dart';
import 'contact_avatar.dart';
import 'unread_message_indicator.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
    required this.onTap,
  });

  final Contact contact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ContactAvatar(
            contact: contact,
          ),
          const Gap(15.0),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        contact.name,
                        style: AppTypography.title16b.copyWith(
                          color: colors(context).contactName,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap(8.0),
                    Text(
                      contact.messages.lastOrNull?.dateTime
                              .toFriendlyString() ??
                          '',
                      style: AppTypography.title13m.copyWith(
                        color: AppColors.grayPinnedChats,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const Gap(3.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (contact.isTyping)
                      Text(
                        'Typing...',
                        style: AppTypography.title14r.copyWith(
                          color: AppColors.contactTyping,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (!contact.isTyping)
                      Text(
                        contact.messages.lastOrNull?.text ?? '',
                        style: AppTypography.title14r.copyWith(
                          color: colors(context).contactLastMessage,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    UnreadMessageIndicator(
                      // numberOfUnreadMessages: 1,
                      numberOfUnreadMessages: contact.messages
                          .where((m) => m.isRead == false)
                          .length,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
