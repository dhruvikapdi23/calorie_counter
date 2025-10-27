import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/module_screens/scan_image/scan_image_controller.dart';
import 'package:camera/camera.dart';
import 'package:scanning_effect/scanning_effect.dart';
import '../../../app_config.dart';


class ScanImage extends StatelessWidget {
  const ScanImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanImageController>(
      init:   ScanImageController(),
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: AppColors.black,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.black,

            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => ctrl.onBack()),
                Text(Fonts.scanMeals.tr, style: AppCss.soraMedium16),
              ],
            ),
            actions: [
              CommonCircleIcon(
                    icon: ctrl.isFlash ? AppSvg.flashOn : AppSvg.flash,
                  )
                  .inkWell(onTap: () => ctrl.flashModeTap())
                  .paddingSymmetric(horizontal: 16),
            ],
          ),
          bottomNavigationBar: FoodOverview(
            calories: "190 kcal",
            weight: "100 g",
            name: "Salad vegetable radish cucumber green",
            image: AppImages.scanImage,
          ).padding(horizontal: 16, bottom: 62),
          body: Center(
            child: ctrl.controller == null
                ? Container()
                : SizedBox(
                    height: 394,
                    child: ScanningEffect(
                      scanningColor: Color(0XFF98E580),
                      borderLineStrokeWidth: 5,
                      borderLineColor: AppColors.greyBorder,
                      delay: Duration(seconds: 1),

                      duration: Duration(seconds: 2),
                      child: SizedBox(
                        height: 394,

                        child: CameraPreview(ctrl.controller!),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
