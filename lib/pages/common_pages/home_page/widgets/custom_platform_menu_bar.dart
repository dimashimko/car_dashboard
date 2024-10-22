import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../navigation/navigation_provider.dart';
import '../../../../resources/theme/theme_provider.dart';
import '../../../../router/app_routes.dart';

class CustomPlatformMenuBar extends StatefulWidget {
  const CustomPlatformMenuBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CustomPlatformMenuBar> createState() => _CustomPlatformMenuBarState();
}

class _CustomPlatformMenuBarState extends State<CustomPlatformMenuBar> {
  void onMenuTapped(int index) {
    Provider.of<NavigationProvider>(
      context,
      listen: false,
    ).changeIndex(
      index,
    );
    if (index == 1) const DashboardRoute().go(context);
    if (index == 2) const AssetsRoute().go(context);
    if (index == 3) const BookingRoute().go(context);
    if (index == 4) const SellCarsRoute().go(context);
    if (index == 5) const BuyCarsRoute().go(context);
    if (index == 6) const ServicesRoute().go(context);
    if (index == 7) const CalenderRoute().go(context);
    if (index == 8) const MessagesRoute().go(context);
    if (index == 9) const SettingRoute().go(context);
    if (index == 0) const SignInRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return PlatformMenuBar(
          menus: <PlatformMenuItem>[
            PlatformMenu(
              label: 'Car Dashboard',
              menus: <PlatformMenuItem>[
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenuItem(
                      label: 'About',
                      onSelected: () {
                        showAboutDialog(
                          context: context,
                          applicationName: 'Car Dashboard',
                          applicationVersion: '1.0.0',
                        );
                      },
                    ),
                  ],
                ),
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenu(
                      label: 'Theme',
                      menus: <PlatformMenuItem>[
                        PlatformMenuItem(
                          onSelected: () {
                            value.toggleToLight();
                          },
                          shortcut: const CharacterActivator('l'),
                          label: 'Light',
                        ),
                        PlatformMenuItem(
                          onSelected: () {
                            value.toggleToDark();
                          },
                          shortcut: const CharacterActivator('d'),
                          label: 'Dark',
                        ),
                      ],
                    ),
                  ],
                ),
                if (PlatformProvidedMenuItem.hasMenu(
                  PlatformProvidedMenuItemType.quit,
                ))
                  const PlatformProvidedMenuItem(
                    type: PlatformProvidedMenuItemType.quit,
                  ),
              ],
            ),
            PlatformMenu(
              label: 'Navigation',
              menus: <PlatformMenuItem>[
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(1),
                      shortcut: const CharacterActivator('1'),
                      label: 'Dashboard',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(2),
                      shortcut: const CharacterActivator('2'),
                      label: 'Assets',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(3),
                      shortcut: const CharacterActivator('3'),
                      label: 'Booking',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(4),
                      shortcut: const CharacterActivator('4'),
                      label: 'Sell Cars',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(5),
                      shortcut: const CharacterActivator('5'),
                      label: 'Buy Cars',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(6),
                      shortcut: const CharacterActivator('6'),
                      label: 'Services',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(7),
                      shortcut: const CharacterActivator('7'),
                      label: 'Calendar',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(8),
                      shortcut: const CharacterActivator('8'),
                      label: 'Messages',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(9),
                      shortcut: const CharacterActivator('9'),
                      label: 'Setting',
                    ),
                    PlatformMenuItem(
                      onSelected: () => onMenuTapped(0),
                      shortcut: const CharacterActivator('0'),
                      label: 'Log out',
                    ),
                  ],
                ),
              ],
            ),
          ],
          child: widget.child,
        );
      },
    );
  }
}
