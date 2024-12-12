import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/pages/chat_page/widgets/chat_action.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/widgets/common/row_scrollable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../models/contact.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import '../../messages_page/widgest/contacts/contact_avatar.dart';

class ChatWidgetTitle extends StatelessWidget {
  const ChatWidgetTitle({
    super.key,
    required this.contact,
    required this.isNeedBackButton,
    required this.onTapBackButton,
  });

  final Contact? contact;
  final bool isNeedBackButton;
  final VoidCallback onTapBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: colors(context).chatFrame,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 17.0,
        ).copyWith(
          left: isNeedBackButton ? 4.0 : 24.0,
          right: 24.0,
        ),
        child: RowScrollable(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (isNeedBackButton)
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: colors(context).notesStatusBannerText,
                      ),
                      onPressed: () => onTapBackButton(),
                    ),
                  ),
                ContactAvatar(
                  contact: contact!,
                ),
                const Gap(13.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact!.name,
                      style: AppTypography.title14m.copyWith(
                        color: colors(context).chatContactName,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      contact!.isOnline ? 'Active Now' : '',
                      style: AppTypography.title14r.copyWith(
                        color: AppColors.chatActiveNowMessage,
                        fontSize: 12.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(8.0),
            Row(
              children: [
                ChatAction(
                  iconPath: Assets.icons.chatVideo.path,
                  onTap: () {},
                ),
                Gap(10.0),
                ChatAction(
                  iconPath: Assets.icons.chatCall.path,
                  onTap: () {},
                ),
                Gap(10.0),
                ChatAction(
                  iconPath: Assets.icons.chatThreePoint.path,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
