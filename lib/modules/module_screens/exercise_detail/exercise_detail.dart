import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'exercise_detail_controller.dart';

class ExerciseDetail extends StatelessWidget {
  const ExerciseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseDetailController>(
      init: ExerciseDetailController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(
                ctrl.isRest?Fonts.tackRest.tr:  ctrl.exerciseDetail != null ? ctrl.exerciseDetail!.name! : "",
                  style: AppCss.soraMedium16,
                ),
              ],
            ),
            actions: [
              ctrl.isRest?Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                decoration: BoxDecoration(
                  color: AppColors.black,borderRadius: BorderRadius.circular(6)
                ),
                child: Text("+20s",style: AppCss.soraMedium14.copyWith(color: AppColors.white),),
              ) :CommonCircleIcon(
                icon: AppSvg.volume,
              ).paddingSymmetric(horizontal: 16),
            ],
          ),
          bottomNavigationBar:ctrl.isRest? appButton(Fonts.skip.tr,onTap: ()=>ctrl.skipTap()).padding(horizontal: 16,bottom: 26): InkWell(
            onTap: ()=> ctrl.onExerciseTap(),
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 26),

              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    padding: EdgeInsets.all(7.5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppSvg.arrowLeft,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ).inkWell(onTap: () => ctrl.nextOrPrevious()),
                  Text(
                    "${ctrl.exerciseIndex + 1}/${ctrl.exerciseList.length} ${Fonts.exercise.tr}",
                    style: AppCss.soraSemiBold16.copyWith(color: AppColors.white),
                  ),
                  Container(
                    height: 38,
                    width: 38,
                    padding: EdgeInsets.all(7.5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppSvg.arrowRight,
                      colorFilter: ColorFilter.mode(
                        AppColors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ).inkWell(onTap: () => ctrl.nextOrPrevious(isNext: true)),
                ],
              ),
            ),
          ),
          body: ctrl.exerciseDetail != null
              ? ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    if(ctrl.isRest)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        margin: EdgeInsets.only(bottom: 17),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(spacing: 9,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${Fonts.resetTime.tr}:",style: AppCss.soraMedium16.copyWith(color: AppColors.white),),
                            Row(spacing: 9,
                              children: [
                                SvgPicture.asset(AppSvg.clock),
                                Text("0:30",style: AppCss.soraMedium32.copyWith(color: AppColors.white),)
                              ],
                            )

                          ],
                        ),
                      ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                      ),
                      height: 248,
                      child: Image.asset(
                        AppImages.exercise6,
                        fit: BoxFit.cover,
                        height: 230,
                      ),
                    ),
                    VSpace(21),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ctrl.isSetDisplay ?Container(
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "2",
                                  style:AppCss.soraBold14.copyWith(color: AppColors.white),
                                  children: [
                                    TextSpan(
                                        text: " ${Fonts.sets.tr}",
                                        style: AppCss.soraRegular14.copyWith(color: AppColors.white)
                                    ),
                                  ],
                                ),
                              ),
                              HSpace(9),
                              RichText(
                                text: TextSpan(
                                  text: "x 20",
                                  style:AppCss.soraBold14.copyWith(color: AppColors.white),
                                  children: [
                                    TextSpan(
                                        text: " ${Fonts.reps.tr}",
                                        style: AppCss.soraRegular14.copyWith(color: AppColors.white)
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ) :     Expanded(
                          child:  Text(
                            ctrl.exerciseDetail!.name!,
                            style: AppCss.soraSemiBold17,
                          ),
                        ),


                        Row(
                          spacing: 10,
                          children: [
                            Text(
                              ctrl.exerciseDetail!.time!,
                              style: AppCss.soraMedium14,
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                SvgPicture.asset(AppSvg.fire, height: 12),
                                Text(
                                  "${ctrl.exerciseDetail!.kcal!} kcal",
                                  style: AppCss.soraMedium14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    if(ctrl.isPausePlay)
                      Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.black.withValues(alpha: .05),
                                  offset: Offset(0, 10),
                                  blurRadius: 20
                              )
                            ]
                        ),
                        child: Column(spacing: 10,
                          children: [
                            CommonSliderIndicator(value: 1205),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "00:10 / ",
                                    style: AppCss.soraMedium13.copyWith(color: AppColors.gary),
                                    children: [
                                      TextSpan(
                                        text: "00:30",
                                        style: AppCss.soraMedium13.copyWith(color: AppColors.black)
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(AppSvg.play)
                              ],
                            )
                          ],
                        ),
                      ),
                    if(ctrl.isSetDisplay)
                      Text(
                        ctrl.exerciseDetail!.name!,
                        style: AppCss.soraSemiBold17,
                      ),

                    VSpace(13),
                    Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonClass.exerciseDetail(
                          Fonts.type,
                          "Cardio / Full Body",
                        ),
                        CommonClass.exerciseDetail(
                          Fonts.level,
                          "Beginner to Intermediate",
                        ),
                        CommonClass.exerciseDetail(Fonts.equipment, "None"),
                        CommonClass.exerciseDetail(
                          Fonts.caloriesBurned,
                          "8–10 per minute (varies by weight and intensity)",
                        ),
                      ],
                    ),
                    VSpace(24),
                    Text(
                      "${Fonts.howToDo.tr} ${ctrl.exerciseDetail!.name}",
                      style: AppCss.soraBold13,
                    ),
                    VSpace(10),
                    ListView.separated(
                      shrinkWrap: true,

                      itemBuilder: (context, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Container(
                            height: 4,
                            width: 4,
                            color: AppColors.black,
                            margin: EdgeInsets.only(top: 5),
                          ),
                          Expanded(
                            child: Text(
                              AppArray.howToDo[index],
                              style: AppCss.soraRegular12.copyWith(
                                color: AppColors.black.withValues(alpha: .80),
                              ),
                            ),
                          ),
                        ],
                      ),
                      separatorBuilder: (context, index) => VSpace(13),
                      itemCount: AppArray.howToDo.length,
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}
