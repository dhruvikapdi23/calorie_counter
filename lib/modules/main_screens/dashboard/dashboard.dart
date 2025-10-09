import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
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
            height: 90,
            padding: EdgeInsets.symmetric(horizontal: 14),
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...AppArray.dashboardList.asMap().entries.map(
                  (e) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        ctrl.currentStep == e.key
                            ? e.value['selectedIcon'].toString()
                            : e.value['icon'].toString(),
                        height: 24,
                      ),
                      HSpace(5),
                       Text(
                        e.value['title'].toString().tr,
                        style: ctrl.currentStep == e.key
                            ? AppCss.soraSemiBold12.copyWith(
                                color: AppColors.primaryColor,
                              )
                            : AppCss.soraRegular12.copyWith(
                                color: AppColors.dashboardLightText,
                              ),
                      ),
                    ],
                  ).inkWell(onTap: ()=> ctrl.nextTo(e.key))
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
