import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/eat_time_model.dart';
import 'package:calorie_counter/modules/auth_screens/user_info_screen/user_info_controller.dart';

import '../../../../app_config.dart';

class EatTimeSelection extends StatefulWidget {
  const EatTimeSelection({super.key});

  @override
  State<EatTimeSelection> createState() => _EatTimeSelectionState();
}

class _EatTimeSelectionState extends State<EatTimeSelection> {
  UserInfoController ctrl = UserInfoController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInfoController>(
      builder: (ctrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            ListView.builder(
              itemCount: AppArray.eatTime.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                EatTimeModel eatTime = AppArray.eatTime[index];
                return Container(
                  padding: EdgeInsets.all(16),
margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: .05),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        eatTime.title.toString().tr,
                                        style: AppCss.soraMedium16.copyWith(
                                          color: eatTime.time != ""
                                              ? AppColors.primaryColor
                                              : AppColors.black,
                                        ),
                                      ),
                                      VSpace(4),
                                      Text(
                                        eatTime.desc.toString().tr,
                                        style: AppCss.soraRegular12,
                                      ),
                                      if (eatTime.time != "") VSpace(11),
                                      if (eatTime.time != "")
                                        Text(
                                              eatTime.time!,
                                              style: AppCss.soraSemiBold13
                                                  .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                            )
                                            .paddingSymmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            )
                                            .decorated(
                                              color:
                                                  AppColors.lightPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        eatTime.time == "" ? AppSvg.addCircle : AppSvg.edit,
                      ).inkWell(
                        onTap: () {
                          ctrl.showTimePickerBottomSheet(context, index);
                        },
                      ),
                    ],
                  ),
                ).inkWell(onTap: () => onTap(eatTime));
              },
            ),
          ],
        ).paddingOnly(top: 32);
      },
    );
  }

  void onTap(index) {
    ctrl.showTimePickerBottomSheet(context, index);
  }
}
