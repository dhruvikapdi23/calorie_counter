import 'package:calorie_counter/extension/widget_extension.dart';

import '../../app_config.dart';

class TabLayout extends StatelessWidget {
  final int? index, selectedIndex;
  final dynamic data;
  final GestureTapCallback? onTap;

  const TabLayout(
      {super.key, this.selectedIndex, this.index, this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Text(data.toString().tr,
              style: index == selectedIndex
                  ? Get.theme.textTheme.displaySmall!.copyWith(
                      fontSize: FontDimen.dimen18,
                      color: Get.theme.scaffoldBackgroundColor)
                  : Get.theme.textTheme.displaySmall!.copyWith(
                      fontSize: FontDimen.dimen16,
                      color: Get.theme.primaryColor.withValues(alpha:.40)))
          .inkWell(onTap: onTap),
    ));
  }
}
