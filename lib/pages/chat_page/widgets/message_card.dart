import 'package:car_dashboard/pages/messages_page/widgest/contacts/contact_avatar.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:car_dashboard/widgets/common/custom_audio_player.dart';
import 'package:flutter/material.dart';

import '../../../models/contact.dart';
import '../../../models/message.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.message,
    required this.isFirstInGroup,
    required this.isLastInGroup,
    required this.contact,
    required this.myContact,
  });

  final Message message;
  final bool isFirstInGroup;
  final bool isLastInGroup;
  final Contact contact;
  final Contact myContact;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMy ? Alignment.centerRight : Alignment.centerLeft,
      child: SizedBox(
        width: isFirstInGroup ? 464.0 : 400.0,
        child: Column(
          crossAxisAlignment:
              message.isMy ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isFirstInGroup && !message.isMy)
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: ContactAvatar(
                      contact: contact,
                      isNeedShowStatus: false,
                    ),
                  ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ).copyWith(
                        topLeft: Radius.circular(message.isMy ? 10.0 : 0.0),
                        topRight: Radius.circular(message.isMy ? 0.0 : 10.0),
                      ),
                      color: message.isMy
                          ? AppColors.primary.purple
                          : colors(context).messageBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 14.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message.audio?.isNotEmpty ?? false)
                            AudioPlayerWithWaveform(
                              audioAsset: message.audio!,
                            ),
                          if (message.text.isNotEmpty)
                            Text(
                              message.text,
                              style: TextStyle(
                                color: message.isMy
                                    ? AppColors.white
                                    : colors(context).notesStatusBannerText,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isFirstInGroup && message.isMy)
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: ContactAvatar(
                      contact: myContact,
                      isNeedShowStatus: false,
                    ),
                  ),
              ],
            ),
            if (isLastInGroup)
              Text(
                message.dateTime.toCustomFormat(),
                style: AppTypography.title13m.copyWith(
                  color: colors(context).averagePrice,
                ),
              )
          ],
        ),
      ),
    );
  }
}
