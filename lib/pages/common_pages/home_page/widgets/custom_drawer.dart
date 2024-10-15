import 'package:car_dashboard/pages/common_pages/home_page/widgets/drawer_item.dart';
import 'package:car_dashboard/router/app_routes.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../generated/assets.gen.dart';
import '../../../../resources/theme/custom_theme_extension.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 0) const DashboardRoute().go(context);
    if (index == 1) const AssetsRoute().go(context);
    if (index == 2) const BookingRoute().go(context);
    if (index == 3) const SellCarsRoute().go(context);
    if (index == 4) const BuyCarsRoute().go(context);
    if (index == 5) const ServicesRoute().go(context);
    if (index == 6) const CalenderRoute().go(context);
    if (index == 7) const MessagesRoute().go(context);
    if (index == 8) const SettingRoute().go(context);
    if (index == 9) const SignInRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isExpanded = size.width > 900;
    return Container(
      width: isExpanded ? 250 : 54,
      color: colors(context).background,
      child: Padding(
        padding: EdgeInsets.only(
          left: isExpanded ? 24.0 : 8.0,
          right: isExpanded ? 50.0 : 8.0,
          top: 30.0,
          bottom: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: isExpanded ? 0.0 : 4.0,
                    ),
                    child: Assets.images.logo.image(),
                  ),
                  if (isExpanded) ...[
                    const Gap(17.0),
                    Text(
                      'Motiv.',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: colors(context).textPrimary,
                      ),
                    ),
                  ]
                ],
              ),
            ),
            const Gap(35.0),
            Expanded(
              child: SingleChildScrollView(
                child: SeparatedColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: () => const SizedBox(
                    height: 10.0,
                  ),
                  children: [
                    DrawerItem(
                      isSelected: selectedIndex == 0,
                      onTap: () => onItemTapped(0),
                      iconPath: Assets.icons.dashboardIcon.path,
                      title: 'Dashboard',
                      isExpanded: isExpanded,
                    ),
                    DrawerItem(
                      isSelected: selectedIndex == 1,
                      onTap: () => onItemTapped(1),
                      iconPath: Assets.icons.assetsIcon.path,
                      title: 'Assets',
                      isExpanded: isExpanded,
                    ),
                    DrawerItem(
                      isSelected: selectedIndex == 2,
                      onTap: () => onItemTapped(2),
                      iconPath: Assets.icons.bookingIcon.path,
                      title: 'Booking',
                      isExpanded: isExpanded,
                    ),
                    DrawerItem(
                      isSelected: selectedIndex == 3,
                      onTap: () => onItemTapped(3),
                      iconPath: Assets.icons.sellCarsIcon.path,
                      title: 'Sell Cars',
                      isExpanded: isExpanded,
                    ),
                    DrawerItem(
                      isSelected: selectedIndex == 4,
                      onTap: () => onItemTapped(4),
                      iconPath: Assets.icons.buyCarIcon.path,
                      title: 'Buy Cars',
                      isExpanded: isExpanded,
                    ),
                    DrawerItem(
                      isSelected: selectedIndex == 5,
                      onTap: () => onItemTapped(5),
                      iconPath: Assets.icons.servicesIcon.path,
                      title: 'Services',
                      isExpanded: isExpanded,
                    ),
                    DrawerItem(
                      isSelected: selectedIndex == 6,
                      onTap: () => onItemTapped(6),
                      iconPath: Assets.icons.calendarIcon.path,
                      title: 'Calender',
                      isExpanded: isExpanded,
                    ),
                    DrawerItem(
                      isSelected: selectedIndex == 7,
                      onTap: () => onItemTapped(7),
                      iconPath: Assets.icons.messagesIcon.path,
                      title: 'Messages',
                      isExpanded: isExpanded,
                    ),
                  ],
                ),
              ),
            ),
            DrawerItem(
              isSelected: selectedIndex == 8,
              onTap: () => onItemTapped(8),
              iconPath: Assets.icons.settingsIcon.path,
              title: 'Setting',
              isExpanded: isExpanded,
            ),
            const Gap(24.0),
            DrawerItem(
              isSelected: selectedIndex == 9,
              onTap: () => onItemTapped(9),
              iconPath: Assets.icons.logOut.path,
              title: 'Log out',
              isExpanded: isExpanded,
            ),
          ],
        ),
      ),
    );
  }
}
