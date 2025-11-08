import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_config.dart';
import '../../../../models/gender_model.dart';

class GenderSelection extends StatelessWidget {
  final String? gender;
  final Function(String) onTap;

  const GenderSelection({super.key, this.gender, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       ListView.builder(
         itemCount: AppArray.genderList.length,
         shrinkWrap: true,
         scrollDirection: Axis.horizontal,
         itemBuilder: (context, index) {
           GenderModel data = AppArray.genderList[index];
         return Column(
           spacing: 10.sp,
           children: [
             Container(
               height: 142.h,
               width: 142.w,
               decoration: BoxDecoration(
                 color: AppColors.white,
                 shape: BoxShape.circle,
                 border: Border.all(
                   color: gender == data.title
                       ? AppColors.primaryColor
                       : AppColors.white,
                 ),
               ),
               padding: EdgeInsets.all(SizeUtils.fSize_6()),
               child: Container(
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(data.image.toString()),
                     fit: BoxFit.cover,
                   ),
                   shape: BoxShape.circle,
                 ),
               ),
             ),
             AppText(data.title.toString().tr, style: AppCss.soraMedium20),
           ],
         ).paddingOnly(right: 19.w).inkWell(onTap: () => onTap(data.title));
       },)
      ],
    ).paddingOnly(top: 90.h);
  }


}
