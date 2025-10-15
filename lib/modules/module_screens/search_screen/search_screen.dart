import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/module_screens/search_screen/search_screen_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      init: SearchScreenController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(Fonts.search.tr, style: AppCss.soraMedium16),
              ],
            ),

            actions: [
              CommonClass.commonCircleIcon(AppSvg.filter),

              HSpace(4),
              CommonClass.commonCircleIcon(AppSvg.scan),
              HSpace(16),
            ],
          ),
bottomNavigationBar: appButton(Fonts.addFood.tr).padding(horizontal: 16,bottom: 30),
          body: Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                children: [
                  AppTextField(
                    color: AppColors.white,
                    onTap: () => Get.toNamed(RouteName.search),
                    bColor: Colors.transparent,
                    bRadius: 12,
                    hintText: Fonts.searchFood.tr,
                    hintStyle: AppCss.soraRegular14.copyWith(color: AppColors.gary),
                    prefixIcon: SvgPicture.asset(
                      AppSvg.search1,
                    ).paddingSymmetric(horizontal: 14),
                  ),
                  VSpace(12),
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6)
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
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey.withValues(alpha: .20),
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(data['icon']),
                              SizedBox(width: 5),
                              Text(data['title'], style: AppCss.soraRegular14.copyWith(color: AppColors.gary))
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
              Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.noData,height: 107,),
                    VSpace(18),
                    Text(Fonts.noResultsFound.tr,style: AppCss.soraMedium16,),
                    VSpace(8),
                    Text(Fonts.noResultsFoundDesc.tr,textAlign: TextAlign.center,style: AppCss.soraLight12.copyWith(color: AppColors.black.withValues(alpha: .80)),).paddingSymmetric(horizontal: 87)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
