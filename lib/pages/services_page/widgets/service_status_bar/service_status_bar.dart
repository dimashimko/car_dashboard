import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../models/part_car_status.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import 'service_status_bar_card.dart';

class ServiceStatusBar extends StatefulWidget {
  const ServiceStatusBar({super.key});

  @override
  State<ServiceStatusBar> createState() => _ServiceStatusBarState();
}

class _ServiceStatusBarState extends State<ServiceStatusBar> {
  List<PartCarStatus> list = [
    PartCarStatus(
      imagePath: Assets.images.serviceOilLevel.path,
      name: 'Oil Level',
      carPart: 'Engine',
      status: 'Don’t Replace',
      condition: 30.0,
      color: AppColors.primary.purple,
    ),
    PartCarStatus(
      imagePath: Assets.images.serviceBrakePads.path,
      name: 'Brake Pads',
      carPart: 'Wheels',
      status: 'Still Good',
      condition: 40.0,
      color: AppColors.secondary.green,
    ),
    PartCarStatus(
      imagePath: Assets.images.serviceSteering.path,
      name: 'Steering',
      carPart: 'Drivetrain',
      status: 'Need Change',
      condition: 15.0,
      color: AppColors.secondary.yellow,
    ),
    PartCarStatus(
      imagePath: Assets.images.serviceOilLevel.path,
      name: 'Oil Level',
      carPart: 'Engine',
      status: 'Don’t Replace',
      condition: 75.0,
      color: AppColors.secondary.orange,
    ),
  ];

  final ScrollController _scrollController = ScrollController();
  bool _showLeftButton = false;
  bool _showRightButton = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateButtonVisibility);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollTo(-1);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateButtonVisibility);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateButtonVisibility() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScrollPosition = _scrollController.position.pixels;

    setState(() {
      _showLeftButton = currentScrollPosition > 0;
      _showRightButton = currentScrollPosition < maxScrollExtent;
    });
  }

  void _scrollTo(double offset) {
    _scrollController.animateTo(
      _scrollController.offset + offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 32.0,
            ),
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(
                width: 60.0,
              ),
              itemBuilder: (context, index) => ServiceStatusBarCard(
                partCarStatus: list[index],
              ),
            ),
          ),
          if (_showLeftButton)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () => _scrollTo(-300),
                child: SizedBox(
                  height: double.infinity,
                  width: 48.0,
                  child: Assets.icons.arrowsLeftElongated2.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.gray.dark4,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          if (_showRightButton)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () => _scrollTo(300),
                child: SizedBox(
                  height: double.infinity,
                  width: 48.0,
                  child: Assets.icons.arrowsRightElongated2.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.gray.dark4,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
