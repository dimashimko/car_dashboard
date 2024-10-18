import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/parameter_model.dart';
import 'parameter_item.dart';

class ParameterPair extends StatelessWidget {
  const ParameterPair({
    super.key,
    required this.parameterFirst,
    required this.parameterSecond,
  });

  final ParameterModel parameterFirst;
  final ParameterModel parameterSecond;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ParameterItem(
            parameter: parameterFirst,
          ),
          const Gap(30.0),
          ParameterItem(
            parameter: parameterSecond,
          ),
        ],
      ),
    );
  }
}
