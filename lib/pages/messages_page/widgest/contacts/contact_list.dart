import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/models/contact.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../resources/app_typography.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import '../../../common_pages/home_page/widgets/search_text_field.dart';
import 'contact_card.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({
    super.key,
    required this.onTap,
    required this.contacts,
  });

  final ValueChanged<Contact> onTap;
  final List<Contact> contacts;

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        widget.contacts.where((e) => e.isPinned).toList();
                    return ListView.separated(
                      itemCount: listPinned.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 26.0,
                      ),
                      itemBuilder: (context, index) => ContactCard(
                        contact: listPinned[index],
                        onTap: () => widget.onTap(
                          listPinned[index],
                        ),
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
                    List<Contact> listNoPinned =
                        widget.contacts.where((e) => !e.isPinned).toList();
                    return ListView.separated(
                      itemCount: listNoPinned.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 26.0,
                      ),
                      itemBuilder: (context, index) => ContactCard(
                        contact: listNoPinned[index],
                        onTap: () => widget.onTap(listNoPinned[index]),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
