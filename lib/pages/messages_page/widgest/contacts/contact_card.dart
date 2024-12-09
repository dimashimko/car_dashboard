import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/contact.dart';
import '../../../../resources/app_colors.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.0,
          width: 50.0,
          // color: Colors.orange,
          child: ClipOval(
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
        ),
        const Gap(15.0),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    contact.name,
                    style: AppTypography.title16b.copyWith(
                      color: colors(context).contactName,
                    ),
                  ),
                  Text(
                    contact.messages.lastOrNull?.dateTime.toFriendlyString() ??
                        '',
                    style: AppTypography.title13m.copyWith(
                      color: AppColors.grayPinnedChats,
                    ),
                  ),
                ],
              ),
              const Gap(3.0),
              Row(
                children: [
                  if (contact.isTyping)
                    Text(
                      'Typing...',
                      style: AppTypography.title14r.copyWith(
                        color: AppColors.contactTyping,
                      ),
                    ),
                  if (!contact.isTyping)
                    Text(
                      contact.messages.lastOrNull?.text ?? '',
                      style: AppTypography.title14r.copyWith(
                        color: colors(context).contactLastMessage,
                      ),
                    ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
