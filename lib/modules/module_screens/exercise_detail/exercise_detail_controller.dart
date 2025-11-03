import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/exercise_model.dart';
import '../../../app_config.dart';


class ExerciseDetailController extends GetxController {
  ExerciseModel? exerciseDetail;
  int exerciseIndex = 0;
  List<ExerciseModel> exerciseList = [];

  bool isSetDisplay = false;
  bool isRest = false;
  bool isPausePlay = false;

  @override
  void onInit() {
    // TODO: implement onInit
    exerciseDetail = Get.arguments;
    exerciseList = AppArray.exerciseList
        .map((e) => ExerciseModel.fromJson(e))
        .toList();
    exerciseIndex = exerciseList.indexWhere(
      (element) => element.name == exerciseDetail!.name,
    );
    update();
    Future.delayed(Duration(seconds: 4)).then((value) {
      isSetDisplay = true;
      update();
    });

    update();
    super.onInit();
  }

  previousExercise() {
    if (exerciseIndex > 0) {
      exerciseIndex = exerciseIndex - 1;
    }
    exerciseDetail = exerciseList[exerciseIndex];
    update();
    Get.back();
  }

  nextExercise() {
    if (exerciseIndex < AppArray.exerciseList.length - 1) {
      exerciseIndex = exerciseIndex + 1;
    }
    exerciseDetail = exerciseList[exerciseIndex];
    update();
    Get.back();
  }

  nextOrPrevious({isNext = false}) => showModalBottomSheet<void>(
    context: Get.context!,
    isDismissible: false,
    isScrollControlled: true,
    // 👈 important for full flexibility
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    backgroundColor: AppColors.white,
    barrierColor: const Color(0xFF292C2F).withValues(alpha: .60),
    elevation: 5,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(
            context,
          ).viewInsets.bottom, // for keyboard safety
        ),
        child:
            Column(
              mainAxisSize: MainAxisSize.min, // 👈 allows auto height
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(exerciseDetail!.name!, style: AppCss.soraMedium24),
                    SvgPicture.asset(
                      AppSvg.closeCircle,
                    ).inkWell(onTap: () => Get.back()),
                  ],
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.exercise6,
                    height: 179,
                    fit: BoxFit.contain,
                  ).paddingSymmetric(horizontal: 62.5),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: appButton(
                        Fonts.done.tr,
                        color: AppColors.lightPrimaryColor,
                        style: AppCss.soraMedium16.copyWith(
                          color: AppColors.black,
                        ),
                        onTap: () =>
                            isNext ? nextExercise() : previousExercise(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: appButton(
                        Fonts.skip.tr,
                        onTap: () => Get.back(),
                        color: AppColors.primaryColor,
                        style: AppCss.soraMedium16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(
              vertical: AppDimens.dimen30,
              horizontal: AppDimens.dimen16,
            ),
      );
    },
  );

  onExerciseTap() {
    if (isPausePlay == false) {
      isRest = true;
    } else {
      Get.toNamed(RouteName.completedExercise);
    }
    update();
  }

  skipTap() {
    isRest = false;
    isPausePlay = true;
    update();
  }
}
