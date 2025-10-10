import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/modules/main_screens/dashboard/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<DashboardController>(
      init: DashboardController(),

      builder: (ctrl) {
        return Scaffold(
          body: ctrl.pages[ctrl.currentStep],
          bottomNavigationBar: Container(
            height: 90,alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 14,vertical: 20),
            color: AppColors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppArray.dashboardList.length,
              itemBuilder: (context, index) {
                final item = AppArray.dashboardList[index];

                return InkWell(
                  onTap: () => onTap(index, ctrl),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        SvgPicture.asset(
                          ctrl.currentStep == index
                              ? item.selectedIcon.toString()
                              : item.icon.toString(),
                          height: 24,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item.title.toString().tr,
                          style: ctrl.currentStep == index
                              ? AppCss.soraSemiBold12.copyWith(
                            color: AppColors.primaryColor,
                          )
                              : AppCss.soraRegular12.copyWith(
                            color: AppColors.dashboardLightText,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ),
        );
      },
    );
  }

  void onTap(index,DashboardController ctrl){
    ctrl.nextTo(index);
  }
}
