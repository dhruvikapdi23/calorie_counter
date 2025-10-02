import 'package:calorie_counter/extension/widget_extension.dart';

import '../app_config.dart';

class CommonActionIconButton extends StatelessWidget {
  final String? arrow;
  final bool isThirty;
  final Color? color, svgColor;
  final GestureTapCallback? onTap;

  const CommonActionIconButton(
      {super.key,
      this.arrow,
      this.color,
      this.svgColor,
      this.onTap,
      this.isThirty = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height:isThirty? 30:26,
            width: isThirty? 30:26,
            child: SvgPicture.asset(arrow!, fit: BoxFit.scaleDown,colorFilter: ColorFilter.mode(svgColor??Get.theme.iconTheme.color!, BlendMode.srcIn),))
        .decorated(
            borderRadius: BorderRadius.circular(8),
            color: color ?? Get.theme.cardColor)
        .inkWell(onTap: onTap)
        .paddingOnly(right: AppDimens.dimen42);
  }
}
