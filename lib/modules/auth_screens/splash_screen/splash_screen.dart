import 'package:calorie_counter/modules/auth_screens/splash_screen/splash_controller.dart';

import '../../../app_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (ctrl) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: const AssetImage(AppImages.logo),
                   height: 92,
                   /* height: MediaQuery.sizeOf(context).height * 0.250,
                    width: MediaQuery.sizeOf(context).height * 0.250*/),
                VSpace(12),
                Text(Fonts.appName.tr,style: AppCss.soraSemiBold24,)
              ],
            ),
          ),
        );
      }
    );
  }
}
