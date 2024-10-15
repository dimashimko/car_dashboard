import 'package:car_dashboard/pages/common_pages/home_page/widgets/search_text_field.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../generated/assets.gen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isExpanded = size.width > 600;

    return Container(
      height: 78.0,
      width: double.infinity,
      color: colors(context).background,
      child: Row(
        children: [
          if (isExpanded)
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 16.0,
              ),
              child: SizedBox(
                width: 358.0,
                height: 60,
                child: SearchTextField(),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Assets.icons.search.svg(),
              ),
            ),
          const Spacer(),
          Assets.icons.notification.svg(),
          const Gap(39.0),
          Assets.images.avatar.image(
            height: 48.0,
            width: 48.0,
          ),
        ],
      ),
    );
  }
}
