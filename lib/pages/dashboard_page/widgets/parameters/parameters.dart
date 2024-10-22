import 'package:flutter/material.dart';

import '../../../../generated/assets.gen.dart';
import '../../../../models/parameter_model.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import 'parameter_item.dart';

class Parameters extends StatefulWidget {
  const Parameters({super.key});

  @override
  State<Parameters> createState() => _ParametersState();
}

class _ParametersState extends State<Parameters> {
  List<ParameterModel> parameters = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    parameters = [
      ParameterModel(
        icon: Assets.icons.energy.svg(),
        title: 'Energy',
        percent: 45.0,
        arcColor: AppColors.gray.white,
        arcBackgroundColor: AppColors.lightPurple,
        textColor: AppColors.gray.white,
        backgroundColor: AppColors.primary.purple,
      ),
      ParameterModel(
        icon: Assets.icons.range.svg(),
        title: 'Range',
        percent: 57.0,
        arcColor: AppColors.rangeColor,
        arcBackgroundColor: colors(context).inactive,
        textColor: colors(context).parametersTextColor,
        backgroundColor: colors(context).background,
      ),
      ParameterModel(
        icon: Assets.icons.breakFluid.svg(),
        title: 'Break fluid',
        percent: 9.0,
        arcColor: AppColors.primary.purple,
        arcBackgroundColor: colors(context).inactive,
        textColor: colors(context).parametersTextColor,
        backgroundColor: colors(context).background,
      ),
      ParameterModel(
        icon: Assets.icons.tireWear.svg(),
        title: 'Tire Wear',
        percent: 25.0,
        arcColor: AppColors.secondary.yellow,
        arcBackgroundColor: colors(context).inactive,
        textColor: colors(context).parametersTextColor,
        backgroundColor: colors(context).background,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: parameters.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400.0,
          mainAxisExtent: 266.0,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 30.0,
        ),
        itemBuilder: (context, index) {
          return ParameterItem(
            parameter: parameters[index],
          );
        },
      ),
    );
  }
}
