import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.gen.dart';
import '../../resources/app_typography.dart';
import '../../resources/theme/custom_theme_extension.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/dividers/custom_divider.dart';
import 'widgets/parts_bar.dart';
import 'widgets/setting_text_field.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors(context).background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 49.0,
              bottom: 42.0,
              left: 34.0,
              right: 46.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: AppTypography.headingH1.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                const Gap(16.0),
                const PartsBar(),
                const Gap(48.0),
                Text(
                  'Profile',
                  style: AppTypography.headingH3.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                const Gap(24.0),
                const CustomDivider(),
                const Gap(30.0),
                Row(
                  children: [
                    Expanded(
                      child: SettingTextField(
                        title: 'Live in',
                        initialText: 'Zuichi, Switzerland',
                        prefixIconPath: Assets.icons.home.path,
                      ),
                    ),
                    const Gap(36.0),
                    Expanded(
                      child: SettingTextField(
                        title: 'Street Address',
                        initialText: '2445 Crosswind Drive',
                        prefixIconPath: Assets.icons.home.path,
                      ),
                    ),
                  ],
                ),
                const Gap(30.0),
                SettingTextField(
                  title: 'Email Address',
                  initialText: 'uihutofficial@gmail.com',
                  prefixIconPath: Assets.icons.email.path,
                ),
                const Gap(30.0),
                Row(
                  children: [
                    Expanded(
                      child: SettingTextField(
                        title: 'Date Of Birth',
                        initialText: '07.12.195',
                        prefixIconPath: Assets.icons.birthday.path,
                      ),
                    ),
                    const Gap(36.0),
                    Expanded(
                      child: SettingTextField(
                        title: 'Gender',
                        initialText: 'Male',
                        prefixIconPath: Assets.icons.male.path,
                      ),
                    ),
                  ],
                ),
                const Gap(30.0),
                const CustomDivider(),
                const Gap(24.0),
                Row(
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 100, // Set minimum width
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your photo',
                              style: AppTypography.title16m.copyWith(
                                color: colors(context).parametersTextColor,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'This will be displayed on your profile.',
                              style: AppTypography.title14r.copyWith(
                                color: AppColors.gray.dark4,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox.square(
                        dimension: 64.0,
                        child: ClipOval(
                          clipBehavior: Clip.hardEdge,
                          child: Assets.images.avatarSetting.image(
                            height: 64.0,
                            width: 64.0,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Spacer(),
                    const Gap(10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Delete',
                              style: AppTypography.title14r.copyWith(
                                color: AppColors.gray.dark4,
                              ),
                            ),
                          ),
                        ),
                        const Gap(6.0),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Update',
                              style: AppTypography.title14r.copyWith(
                                color: AppColors.primary.purple,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const Gap(24.0),
                const CustomDivider(),
                const Gap(24.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        'Social Profiles',
                        style: AppTypography.title16m.copyWith(
                          color: colors(context).parametersTextColor,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          CustomTextField(
                            initialText: 'facebook.com/',
                            onSubmitMessage: (String value) {},
                          ),
                          const Gap(16.0),
                          CustomTextField(
                            initialText: 'twitter.com/',
                            onSubmitMessage: (String value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
