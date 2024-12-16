import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/router/app_routes.dart';
import 'package:car_dashboard/widgets/common/custom_text_field.dart';
import 'package:car_dashboard/widgets/dividers/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/buttons/facebook_auth_button.dart';
import '../../widgets/buttons/google_auth_button.dart';
import '../../widgets/buttons/purple_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isChecked = false;

  void onTapSignIn(BuildContext context) {
    const DashboardRoute().go(context);
  }

  void goToSignUp(BuildContext context) {
    const SignUpRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors(context).background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Container(
                        width: 506.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Get’s started.',
                              style: AppTypography.headingH1.copyWith(
                                color: colors(context).parametersTextColor,
                              ),
                            ),
                            const Gap(16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account? ',
                                  style: AppTypography.title18R.copyWith(
                                    color: AppColors.gray.dark4,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    goToSignUp(context);
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: AppTypography.title18M.copyWith(
                                      color: AppColors.primary.purple,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(54.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GoogleAuthButton(
                                    onTap: () {
                                      onTapSignIn(context);
                                    },
                                  ),
                                ),
                                const Gap(14.0),
                                Expanded(
                                  child: FacebookAuthButton(
                                    onTap: () {
                                      onTapSignIn(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const Gap(24.0),
                            Row(
                              children: [
                                const Expanded(
                                  child: CustomDivider(),
                                ),
                                Text(
                                  ' or ',
                                  style: AppTypography.title18M.copyWith(
                                    color: colors(context).bookingIconColor,
                                  ),
                                ),
                                const Expanded(
                                  child: CustomDivider(),
                                ),
                              ],
                            ),
                            const Gap(24.0),
                            Container(
                              width: 506.0,
                              decoration: BoxDecoration(
                                color: colors(context).background,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                border: Border.all(
                                  color: colors(context).authContainerStroke,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 10.0),
                                    blurRadius: 110.0,
                                    spreadRadius: 1.0,
                                    color: AppColors.gray3B.withOpacity(0.08),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  20.0,
                                  20.0,
                                  40.0,
                                  20.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email',
                                      style: AppTypography.title16m.copyWith(
                                        color: colors(context)
                                            .notesStatusBannerText,
                                      ),
                                    ),
                                    const Gap(12.0),
                                    CustomTextField(
                                      onSubmitMessage: (String newEmail) {},
                                      initialText: 'uistore@gmail.com',
                                    ),
                                    const Gap(20.0),
                                    Text(
                                      'Password',
                                      style: AppTypography.title16m.copyWith(
                                        color: colors(context)
                                            .notesStatusBannerText,
                                      ),
                                    ),
                                    const Gap(12.0),
                                    CustomTextField(
                                      onSubmitMessage: (String newEmail) {},
                                      initialText: 'some password...',
                                      isPasswordField: true,
                                      suffixIconPath: Assets.icons.eye.path,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  },
                                  child: isChecked
                                      ? Assets.icons.checkboxOnPurple.svg()
                                      : Assets.icons.checkboxOff.svg(),
                                ),
                                Gap(13.0),
                                Text(
                                  'Remember me',
                                  style: AppTypography.title16m.copyWith(
                                    color: colors(context).rememberMeText,
                                  ),
                                ),
                                Gap(8.0),
                                Spacer(),
                                Text(
                                  'Forgot your password?',
                                  style: AppTypography.title16m.copyWith(
                                    color: AppColors.primary.purple,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(30.0),
                            PurpleButton(
                              text: 'Sign in',
                              onTap: () {
                                onTapSignIn(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
