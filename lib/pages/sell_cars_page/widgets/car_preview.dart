import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:o3d/o3d.dart';

import '../../../generated/assets.gen.dart';
import '../../../resources/theme/custom_theme_extension.dart';

class CarPreview extends StatefulWidget {
  const CarPreview({super.key});

  @override
  State<CarPreview> createState() => _CarPreviewState();
}

class _CarPreviewState extends State<CarPreview> {
  // to control the animation
  final O3DController controller = O3DController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 43.0,
          vertical: 28.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '2022 Mercedes Benz ',
              style: AppTypography.headingH1.copyWith(
                color: colors(context).parametersTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Assets.icons.layer01.svg(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48.0),
                    child: Assets.icons.layer02.svg(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 81.0),
                    child: Assets.icons.layer03.svg(),
                  ),
                  // O3D.asset(
                  //   src: 'assets/low_poly_tesla_roadster.glb',
                  //   controller: controller,
                  // ),
                  Flutter3DViewer.obj(
                    // src: 'assets/flutter_dash.obj',
                    // src: 'assets/ford_mustang.obj',
                    src: 'assets/tesla.obj',
                    // src: 'assets/mercedes_benz_gls_580.obj',
                    // src:
                    //     'https://raw.githubusercontent.com/m-r-davari/content-holder/refs/heads/master/flutter_3d_controller/flutter_dash_model/flutter_dash.obj',
                    scale: 10,
                    // Initial scale of obj model
                    cameraX: 0,
                    // Initial cameraX position of obj model
                    cameraY: 0,
                    //Initial cameraY position of obj model
                    cameraZ: 10,
                    //Initial cameraZ position of obj model
                    //This callBack will return the loading progress value between 0 and 1.0
                    onProgress: (double progressValue) {
                      debugPrint('model loading progress : $progressValue');
                    },
                    //This callBack will call after model loaded successfully and will return model address
                    onLoad: (String modelAddress) {
                      debugPrint('model loaded : $modelAddress');
                    },
                    //this callBack will call when model failed to load and will return failure erro
                    onError: (String error) {
                      debugPrint('model failed to load : $error');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
