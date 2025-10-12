
import 'package:calorie_counter/app_config.dart';

class AppDecoration {
  static BoxDecoration cardDecoration() {
    return BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(AppDimens.dimen24));
  }

  static BoxDecoration textBoxDecoration({color, bColor, radius}) {
    return BoxDecoration(
        color: color,
        border: Border.all(color: bColor),
        borderRadius: BorderRadius.circular(radius));
  }
}
