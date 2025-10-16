import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';

class SearchOption extends StatelessWidget {
  final Function(String) onTap;
  final String? selectedOption;
  const SearchOption({super.key, required this.onTap, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(5),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: AppArray.searchOption.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemBuilder: (context, index) {
          dynamic data = AppArray.searchOption[index];
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.5,
              vertical: 11,
            ),
            decoration: BoxDecoration(
              color:selectedOption ==data['title']?AppColors.primaryColor:  AppColors.lightGrey.withValues(alpha: .20),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                SvgPicture.asset(data['icon'],colorFilter: ColorFilter.mode(selectedOption ==data['title']?AppColors.white:AppColors.gary, BlendMode.srcIn),),
                SizedBox(width: 5),
                Text(
                  data['title'].toString().tr,
                  style: AppCss.soraRegular14.copyWith(
                    color:selectedOption ==data['title']?AppColors.white: AppColors.gary,
                  ),
                ),
              ],
            ),
          ).inkWell(onTap: ()=>onTap(data['title']));
        },
      ),
    );
  }
}
