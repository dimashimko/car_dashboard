import 'package:flutter/material.dart';

import '../../../../router/app_routes.dart';

enum MenuSelection {
  about,
  showMessage,
}

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
  void _handleMenuSelection(MenuSelection value) {
    switch (value) {
      case MenuSelection.about:
      case MenuSelection.showMessage:
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    _handleMenuSelection(MenuSelection.about);
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
                        _handleMenuSelection(MenuSelection.showMessage);
                        const DashboardRoute().go(context);
                      },
                      shortcut: const CharacterActivator('l'),
                      label: 'Light',
                    ),
                    PlatformMenuItem(
                      onSelected: () {
                        _handleMenuSelection(MenuSelection.showMessage);
                        const AssetsRoute().go(context);
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
                  onSelected: () {
                    _handleMenuSelection(MenuSelection.showMessage);
                    const DashboardRoute().go(context);
                  },
                  shortcut: const CharacterActivator('1'),
                  label: 'Dashboard',
                ),
                PlatformMenuItem(
                  onSelected: () {
                    _handleMenuSelection(MenuSelection.showMessage);
                    const AssetsRoute().go(context);
                  },
                  shortcut: const CharacterActivator('2'),
                  label: 'Assets',
                ),
                PlatformMenuItem(
                  onSelected: () {
                    _handleMenuSelection(MenuSelection.showMessage);
                    const BookingRoute().go(context);
                  },
                  shortcut: const CharacterActivator('3'),
                  label: 'Booking',
                ),
              ],
            ),
          ],
        ),
      ],
      child: widget.child,
    );
  }
}
