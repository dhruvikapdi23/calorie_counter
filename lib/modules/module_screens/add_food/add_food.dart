import 'dart:io';

import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'add_food_controller.dart';

class AddFood extends StatelessWidget {
  const AddFood({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFoodController>(
      init: AddFoodController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(
                  Fonts.createFood.tr,
                  style: AppCss.soraMedium16,
                ),
              ],
            ),
          ),
          bottomNavigationBar: appButton(
            Fonts.createFood.tr,
            //onTap: goToDashboard,
          ).paddingSymmetric(horizontal: 16, vertical: 22),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            children: [
              Text(
                Fonts.addImage.tr,
                style: AppCss.soraSemiBold16,
              ).marginOnly(bottom: AppDimens.dimen16),
              ctrl.image != null
                  ? Container(
                      height: 245,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: FileImage(File(ctrl.image!.path)),
                          fit: BoxFit.cover


                        ),
                      ),
                    )
                  : DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        color: AppColors.primaryColor,
                        strokeWidth: 1,

                        dashPattern: const [8, 6],
                        radius: Radius.circular(12),
                      ),
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 28.5),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(AppSvg.pickImage),
                            VSpace(10),
                            Text(
                              Fonts.addPicture.tr,
                              style: AppCss.soraRegular14.copyWith(
                                color: AppColors.gary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).inkWell(onTap: () => ctrl.pickImage()),
              VSpace(24),
              AppTextField(
                labelText: Fonts.foodName,
                hintText: Fonts.enterFoodName,
                controller: ctrl.foodName,
                bottomSpace: 16,
                labelStyle: AppCss.soraSemiBold16,
              ),
              VSpace(24),
              Text(
                Fonts.addExtraMeal.tr,
                style: AppCss.soraSemiBold16,
              ).marginOnly(bottom: AppDimens.dimen16),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: AppTextField(
                      hintText: "0",
                      controller: ctrl.height,
                      suffixIcon: CommonClass.commonKgCmSuffixIcon("g"),
                    ),
                  ),
                  Expanded(
                    child: AppTextField(
                      hintText: "0",
                      controller: ctrl.weight,
                      suffixIcon: CommonClass.commonKgCmSuffixIcon("Kcal",width: 46),
                    ),
                  ),
                ],
              ),

              VSpace(24),
              Row(
                spacing: 5,
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Text(
                    Fonts.doNotEnterQuantity.tr,
                    style: AppCss.soraRegular12,
                  ),
                ],
              ),
              VSpace(24),
              FoodOverview()
            ],
          ),
        );
      },
    );
  }

  genderTapFunction(AddFoodController ctrl, value) {
    ctrl.selectGender(value);
  }

  deleteConfirmationFunction(AddFoodController ctrl) {
    ctrl.deleteConfirmation();
  }

  Widget genderSelectionWidget(gender, title, svg) => Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: gender == title ? AppColors.primaryColor : AppColors.white,
      border: Border.all(
        color: gender == title ? AppColors.primaryColor : AppColors.strokeColor,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString().tr,
          style: AppCss.soraLight14.copyWith(
            color: gender == title ? AppColors.white : AppColors.gary,
          ),
        ),
        SvgPicture.asset(
          svg,
          colorFilter: ColorFilter.mode(
            gender == title ? AppColors.white : AppColors.black,
            BlendMode.srcIn,
          ),
        ),
      ],
    ),
  );
}
