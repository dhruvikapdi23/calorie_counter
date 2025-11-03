import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/account_setting_model.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'general_information_controller.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralInformationController>(
      init: GeneralInformationController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(
                  Fonts.generalSettings.tr.toUpperCase(),
                  style: AppCss.soraMedium16,
                ),
              ],
            ),
          ),

          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              Text(Fonts.accountSettings.tr, style: AppCss.soraRegular13),
              VSpace(12),
              ListView.builder(
                itemCount: AppArray.accountSettingList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  AccountSettingModel account =
                      AppArray.accountSettingList[index];
                  return Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.strokeColor),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: .05),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(account.title!.tr, style: AppCss.soraMedium14),
                        (account.subMenuList != null)
                            ? Container(
                                padding: EdgeInsets.all(16),

                                decoration: BoxDecoration(
                                  color: AppColors.lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListView.builder(
                                  itemCount: account.subMenuList?.length,

                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    AccountSubMenuList subMenu =
                                        account.subMenuList![i];
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              subMenu.title!.tr,
                                              style: AppCss.soraRegular14,
                                            ),
                                            FlutterSwitch(
                                              value: subMenu.isActive!,
                                              onToggle: (value) =>
                                                  ctrl.activeInactive(
                                                    index,
                                                    i,
                                                    value,
                                                  ),
                                              height: 19,
                                              width: 33,
                                              activeColor:
                                                  AppColors.primaryColor,
                                              inactiveColor: AppColors.gary,
                                              activeToggleColor:
                                                  AppColors.white,
                                              inactiveToggleColor:
                                                  AppColors.white,
                                              toggleSize: 16,
                                              padding: 1,
                                            ),
                                          ],
                                        ),
                                        if (i !=
                                            account.subMenuList!.length - 1)
                                          Divider(
                                            color: AppColors.strokeColor,
                                            height: 0,
                                          ).paddingSymmetric(vertical: 12),
                                      ],
                                    );
                                  },
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20.5,
                                ),

                                decoration: BoxDecoration(
                                  color: AppColors.lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    CommonClass.commonMinusPlus(AppSvg.minus).inkWell(onTap: ()=>minusTapFunction(ctrl, index)),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 13,
                                        ),
                                        alignment: Alignment.center,

                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          border: Border.all(
                                            color: AppColors.strokeColor,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          account.value!.toString(),
                                          style: AppCss.soraSemiBold22,
                                        ),
                                      ),
                                    ),
                                    CommonClass.commonMinusPlus(AppSvg.plus).inkWell(onTap: ()=>plusTapFunction(ctrl, index)),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  );
                },
              ),

              VSpace(36),
              Text(Fonts.restartProgress.tr,style: AppCss.soraMedium16.copyWith(color: AppColors.red1),).alignment(Alignment.center)
            ],
          ),
        );
      },
    );
  }

  void minusTapFunction(GeneralInformationController ctrl,mainIndex){
    ctrl.minusTap(mainIndex);
  }

  void plusTapFunction(GeneralInformationController ctrl,mainIndex){
    ctrl.plusTap(mainIndex);
  }
}
