import 'package:intl/intl.dart';

import '../../../../app_config.dart';

class DailyProgress extends StatelessWidget {
  const DailyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonClass.commonContainerClass(
      padding: EdgeInsets.only(
        left: SizeUtils.fSize_16(),
        right: SizeUtils.fSize_16(),
        top: 26.5,
        bottom: 12.5,
      ),
      Column(
        children: [
          Text(Fonts.dailyProgress.tr, style: AppCss.soraSemiBold24),
          VSpace(10),
          Row(
            spacing: 9,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today,${DateFormat("MMM dd").format(DateTime.now())} ",
                style: AppCss.soraMedium14.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SvgPicture.asset(
                AppSvg.calendar,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          VSpace(14),
          Text(
            Fonts.exerciseAccording.tr,
            style: AppCss.soraRegular14.copyWith(color: AppColors.gary),
          ),
          VSpace(30),

          CommonEatenChart(),
        ],
      ),
    );
  }
}
