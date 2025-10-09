import 'package:calorie_counter/extension/widget_extension.dart';

import '../app_config.dart';

class CommonBackCircle extends StatelessWidget {
  final GestureTapCallback? onTap;
  const CommonBackCircle({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppSvg.arrowLeft)
        .paddingAll(12)
        .decorated(
      color: AppColors.white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withValues(alpha: .05),
          offset: Offset(0, 10),
          blurRadius: 20,
        ),
      ],
    ).inkWell(onTap: onTap);
  }
}
