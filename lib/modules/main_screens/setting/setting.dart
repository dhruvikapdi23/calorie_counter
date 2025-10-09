import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/modules/main_screens/dashboard/dashboard_controller.dart';
import 'package:calorie_counter/modules/main_screens/setting/setting_controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            toolbarHeight: 72,
            title: Text(
              Fonts.settings.tr,
              style: AppCss.soraSemiBold24.copyWith(color: AppColors.white),
            ),
            actions: [

              Stack(
                children: [
                  SvgPicture.asset(AppSvg.bgCircle),
                  SvgPicture.asset(AppSvg.frame),
                ],
              ),
HSpace(4),
              Stack(
                children: [
                  SvgPicture.asset(AppSvg.bgCircle),
                  SvgPicture.asset(AppSvg.bell),
                ],
              ),
              HSpace(16)

            ],
          ),
        );
      },
    );
  }
}
