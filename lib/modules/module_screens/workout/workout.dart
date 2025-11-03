import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/exercise_model.dart';
import 'package:calorie_counter/modules/module_screens/workout/workout_calendar.dart';
import 'package:calorie_counter/modules/module_screens/workout/workout_controller.dart';

import 'package:intl/intl.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkoutController>(
      init: WorkoutController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(Fonts.dailyChallenges.tr, style: AppCss.soraMedium16),
              ],
            ),
          ),
          bottomNavigationBar: appButton(
            Fonts.startExercise.tr,
            onTap: () => ctrl.startExercise(),
          ).padding(horizontal: 16, bottom: 26),

          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            children: [
              Column(
                spacing: 6,
                children: [
                  Text(
                    Fonts.dailyBurnChallenge.tr,
                    style: AppCss.soraSemiBold22,
                  ),
                  Text(
                    Fonts.dailyBurnChallengeDesc.tr,
                    style: AppCss.soraRegular14,
                    textAlign: TextAlign.center,
                  ).paddingSymmetric(horizontal: 41),
                ],
              ),

              VSpace(16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today, ${DateFormat("MMM yyyy").format(ctrl.dateTime)}",
                      style: AppCss.soraMedium12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    VSpace(10),
                    WorkoutCalendar(
                      dateTime: ctrl.dateTime,
                      onDaySelected: (selected, focused) =>
                          selectDate(ctrl, selected),
                    ),
                  ],
                ),
              ),
              VSpace(10),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  ExerciseModel exercise = ctrl.exerciseList[index];
                  return InkWell(
                    onTap: () => selectExercise(ctrl, exercise),
                    child: CommonClass.commonContainerClass(
                      padding: EdgeInsets.all(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGrey.withValues(
                                    alpha: .20,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(exercise.image!),
                              ),
                              Column(
                                spacing: 6,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exercise.name!,
                                    style: AppCss.soraMedium16,
                                  ),
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Text(
                                        exercise.time!,
                                        style: AppCss.soraRegular12.copyWith(
                                          color: AppColors.gary,
                                        ),
                                      ),
                                      Row(
                                        spacing: 5,
                                        children: [
                                          SvgPicture.asset(
                                            AppSvg.fire,
                                            height: 12,
                                          ),
                                          Text(
                                            "${exercise.kcal} kcal",
                                            style: AppCss.soraRegular12
                                                .copyWith(
                                                  color: AppColors.gary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (exercise.name == ctrl.selected?.name)
                            SvgPicture.asset(AppSvg.selected),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => VSpace(10),
                itemCount: ctrl.exerciseList.length,
              ),
            ],
          ),
        );
      },
    );
  }

  void selectDate(WorkoutController ctrl, date) {
    ctrl.selectDate(date);
  }

  void selectExercise(WorkoutController ctrl, data) {
    ctrl.selectExercise(data);
  }
}
