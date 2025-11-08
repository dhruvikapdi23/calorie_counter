import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/modules/main_screens/discover/layouts/clear_professional.dart';
import '../../../widgets/common_dot_list.dart';
import 'discover_controller.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      init: DiscoverController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: CommonAppBar(
            title: Fonts.discover.tr,
            onTap: () => scanTap(),
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowDiscoverOption(
                  title: Fonts.clearProfessional.tr,
                  array: AppArray.clearProfessional,
                  currentStep: ctrl.currentStep,
                ),

                VSpace(24),
                Text(
                  Fonts.healthyLifestyleThemes.tr,
                  style: AppCss.soraSemiBold16,
                ),
                VSpace(16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: AppArray.healthyLifeStyle.length,
                  itemBuilder: (context, index) {
                    dynamic data = AppArray.healthyLifeStyle[index];
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                      ),
                      child: Row(
                        spacing: 9,
                        children: [
                          Container(
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),

                              image: DecorationImage(
                                image: AssetImage(data['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(data['title'],style: AppCss.soraMedium14,),
                                Text(data['subTitle'],style: AppCss.soraRegular12.copyWith(color: AppColors.gary),),
                                Text(data['description'],style: AppCss.soraRegular12,)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),

                VSpace(24),
                Text(Fonts.motivational.tr, style: AppCss.soraSemiBold16),
                VSpace(16),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: 159,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),

                          image: DecorationImage(
                            image: AssetImage(AppImages.discover5),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      VSpace(16),
                      CommonDotList(
                        array: AppArray.foodFocused,
                        currentStep: 0,
                      ),
                    ],
                  ),
                ),
                VSpace(24),
                RowDiscoverOption(
                  title: Fonts.foodFocusedCatchy.tr,
                  array: AppArray.foodFocused,
                  currentStep: ctrl.currentStep,
                ),
              ],
            ).paddingAll(16),
          ),
        );
      },
    );
  }

  void scanTap() {
    Navigation.toNamed(RouteName.scanImage);
  }
}
