import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/module_screens/language_screen/language_controller.dart';

import '../../auth_screens/user_info_screen/layouts/language_selection.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(
                  Fonts.language.tr,
                  style: AppCss.soraMedium16,
                ),
              ],
            ),
          ),
          bottomNavigationBar: appButton(Fonts.save.tr).padding(horizontal: 16,vertical: 30),

          body: LanguageSelection(
            onTap: (p0) => ctrl.onLanguageSelectTap(p0),
            language: ctrl.selectedLanguage?.code,
            isLanguageScreen: true
          ).marginSymmetric(horizontal: 16),
        );
      },
    );
  }
}
