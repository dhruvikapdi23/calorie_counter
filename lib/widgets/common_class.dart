import 'package:calorie_counter/app_config.dart';

class CommonClass{

 static Widget commonWeightHeightTextLayout(context,title, value)=>
      Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: AppColors.white.withValues(alpha: .05),
                  offset: Offset(0, 10),
                  blurRadius: 20
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: AppCss.soraSemiBold18),
            VSpace(6),
            Text(value,style: AppCss.soraBold28.copyWith(color: AppColors.primaryColor)),
            VSpace(10),
            Text(Fonts.lookingStringAndConfident.tr,style: AppCss.soraRegular14),
          ],
        ),
      );
}