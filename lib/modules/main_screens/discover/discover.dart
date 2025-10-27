import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'discover_controller.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      init: DiscoverController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            toolbarHeight: 72,
            title: Text(
              Fonts.discover.tr,
              style: AppCss.soraSemiBold24.copyWith(color: AppColors.white),
            ),
            actions: [
              CommonClass.commonBgCircleIcon(AppSvg.frame).inkWell(onTap: ()=> scanTap()),

              HSpace(4),
              CommonClass.commonBgCircleIcon(AppSvg.bell),
              HSpace(16),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Fonts.clearProfessional.tr,
                  style: AppCss.soraSemiBold16,
                ),
                VSpace(12),

              ],
            ).paddingAll(16),
          ),
        );
      },
    );
  }

  void onTapFunction(DiscoverController ctrl, title) {
    ctrl.categorySelect(title);
  }

  void scanTap() {
    Get.toNamed(RouteName.scanImage);
  }
}
