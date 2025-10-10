
import '../../../app_config.dart';
import 'intro_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IntroController());

    return Scaffold(
      extendBodyBehindAppBar: true, // <--- key part
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            Image(
              image: const AssetImage(AppImages.logo),
              height: 40,
              width: 48,
            ),
            HSpace(12),
            Text(Fonts.appName.tr, style: AppCss.soraMedium18),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.introBg,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Daily Guide\nto Smarter\nEating",
                style: AppCss.soraMedium34,
              ),
              appButton(Fonts.getStarted.tr,onTap:getStartedTap)
            ],
          ).paddingOnly(top: 120,left: 16,right: 16,bottom: 32),

        ],
      ),
    );
  }

 void getStartedTap(){
   Get.toNamed(RouteName.userInfo);
 }
}
