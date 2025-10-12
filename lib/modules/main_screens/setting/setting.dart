import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/setting_model.dart';
import 'package:calorie_counter/modules/main_screens/setting/setting_controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            toolbarHeight: 72,
            title: Text(
              Fonts.settings.tr,
              style: AppCss.soraSemiBold24.copyWith(color: AppColors.white),
            ),
            actions: [
              CommonClass.commonBgCircleIcon(AppSvg.frame),

              HSpace(4),
              CommonClass.commonBgCircleIcon(AppSvg.bell),
              HSpace(16),
            ],
          ),
          bottomNavigationBar: appButton(
            Fonts.logout.tr,
            onTap: ()=>onLogout(ctrl),
            rightIcon: SvgPicture.asset(AppSvg.logout),
            color: AppColors.primaryColor,
          ).paddingSymmetric(horizontal: 16, vertical: 11),
          body: ListView.builder(
            itemCount: AppArray.settingList.length,
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              SettingModel settingModel = AppArray.settingList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle(settingModel.title!),
                  VSpace(12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.lightGrey),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: .05),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: settingModel!.subMenuList?.length,
                      itemBuilder: (context, i) {
                        SubMenuList menuList = settingModel.subMenuList![i];
                        return index == 0
                            ? _feedbackCard(menuList)
                            : _settingsTile(
                                menuList,
                                (i != settingModel.subMenuList!.length - 1),
                                () => onTapFunction(ctrl, menuList.title),
                              );
                      },
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 16);
            },
          ),
        );
      },
    );
  }

  void onTapFunction(SettingController ctrl, title) {
    ctrl.onTapFunction(title);
  }

  void onLogout(SettingController ctrl) {
    ctrl.logout();
  }

  Widget _sectionTitle(String title) {
    return Text(title.tr, style: AppCss.soraRegular13);
  }

  Widget _feedbackCard(SubMenuList submenu) {
    return Row(
      children: [
        SvgPicture.asset(submenu.icon!),
        HSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Text(submenu.title!.tr, style: AppCss.soraRegular14),
            Text(
              submenu.desc!.tr,
              style: AppCss.soraRegular14.copyWith(color: AppColors.gary),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 12);
  }

  Widget _settingsTile(
    SubMenuList submenu,
    isDivider,
    GestureTapCallback onTap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  submenu.icon!,
                  colorFilter: ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
                HSpace(16),
                Text(submenu.title!.tr, style: AppCss.soraRegular14),
              ],
            ),
            SvgPicture.asset(AppSvg.arrowRight),
          ],
        ).padding(horizontal: 12),
        if (isDivider)
          Divider(
            height: 0,
            color: AppColors.lightGrey,
          ).paddingSymmetric(vertical: 14),
      ],
    ).inkWell(onTap: onTap);
  }
}
