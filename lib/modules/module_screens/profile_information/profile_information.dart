import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/module_screens/profile_information/profile_information_controller.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileInformationController>(
      init: ProfileInformationController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(
                  Fonts.profileInformation.tr.toUpperCase(),
                  style: AppCss.soraMedium16,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Fonts.deleteAccount.tr,
                style: AppCss.soraMedium16.copyWith(color: AppColors.red1),
              ).inkWell(onTap: ()=>deleteConfirmationFunction(ctrl)),

              VSpace(16),
              appButton(
                Fonts.save.tr,
                //onTap: goToDashboard,
              ),

              VSpace(30),
            ],
          ).paddingSymmetric(horizontal: 16),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            children: [
              AppTextField(
                labelText: Fonts.emailAddress,
                hintText: Fonts.enterEmailAddress,
                controller: ctrl.email,
              ),
              VSpace(17),
              AppTextField(
                labelText: Fonts.firstName,
                hintText: Fonts.enterFirstName,
                controller: ctrl.name,
              ),
              VSpace(17),
              AppTextField(
                labelText: Fonts.dateOfBirth,
                hintText: Fonts.enterDateOfBirth,
                controller: ctrl.dob,
                suffixIcon: SvgPicture.asset(
                  AppSvg.calendar,
                ).paddingSymmetric(horizontal: 12),
                readOnly: true,
              ),
              VSpace(17),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: AppTextField(
                      labelText: Fonts.height,
                      hintText: "0",
                      controller: ctrl.height,
                      suffixIcon: CommonClass.commonKgCmSuffixIcon("cm"),
                    ),
                  ),
                  Expanded(
                    child: AppTextField(
                      labelText: Fonts.weight,
                      hintText: "0",
                      controller: ctrl.weight,
                      suffixIcon: CommonClass.commonKgCmSuffixIcon("kg"),
                    ),
                  ),
                ],
              ),

              VSpace(17),
              AppTextField(
                labelText: Fonts.weightGoal,
                hintText: Fonts.enterYourWeightGoal,
                controller: ctrl.weightGoal,
              ),
              VSpace(17),
              Text(
                Fonts.gender.tr,
                style: AppCss.soraRegular14.copyWith(color: AppColors.black1),
              ).marginOnly(bottom: AppDimens.dimen8),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: genderSelectionWidget(
                      ctrl.gender,
                      Fonts.male,
                      AppSvg.male,
                    ).inkWell(onTap: () => genderTapFunction(ctrl, "male")),
                  ),
                  Expanded(
                    child: genderSelectionWidget(
                      ctrl.gender,
                      Fonts.female,
                      AppSvg.woman,
                    ).inkWell(onTap: () => genderTapFunction(ctrl, "female")),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  genderTapFunction(ProfileInformationController ctrl, value) {
    ctrl.selectGender(value);
  }

  deleteConfirmationFunction(ProfileInformationController ctrl) {
    ctrl.deleteConfirmation();
  }

  Widget genderSelectionWidget(gender, title, svg) => Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: gender == title ? AppColors.primaryColor : AppColors.white,
      border: Border.all(
        color: gender == title
            ? AppColors.primaryColor
            : AppColors.strokeColor,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString().tr,
          style: AppCss.soraLight14.copyWith(color:gender == title?AppColors.white: AppColors.gary),
        ),
        SvgPicture.asset(svg,colorFilter: ColorFilter.mode(gender == title?AppColors.white:AppColors.black, BlendMode.srcIn),),
      ],
    ),
  );
}
