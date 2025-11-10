import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:intl/intl.dart';

import '../../../utils/size_utils.dart';
import '../../module_screens/search_screen/layouts/all_search_list.dart';
import 'home_controller.dart';
import 'layouts/fuel_tank_custom_painter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (ctrl) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.topCenter,
                  children: [
                    _buildHeader(),
                    CommonClass.commonContainerClass(
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                AppSvg.arrowLeft1,
                              ).inkWell(onTap: () => arrowLeft(ctrl)),
                              Row(
                                spacing: 9,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    "Today,${DateFormat("MMM dd").format(ctrl.currentDate)} ",
                                    style: AppCss.soraMedium14.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    AppSvg.calendar,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                AppSvg.arrowRight,
                              ).inkWell(onTap: () => arrowRight(ctrl)),
                            ],
                          ),
                          VSpace(12),

                          CommonEatenChart(),
                        ],
                      ),
                      margin: EdgeInsets.only(left: SizeUtils.fSize_16(), right: SizeUtils.fSize_16(), top: 147),
                      padding: EdgeInsets.all(SizeUtils.fSize_16()),
                    ),
                  ],
                ),

                VSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(Fonts.addMeal.tr, style: AppCss.soraBold16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        spacing: 2,
                        children: [
                          SvgPicture.asset(AppSvg.add),
                          AppText(
                            Fonts.add.tr,
                            style: AppCss.soraRegular13.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ).inkWell(onTap: () => addMeal()),
                  ],
                ).paddingSymmetric(horizontal: 16),
                VSpace(12),

                AllSearchList(
                  list: AppArray.foodItems.getRange(0, 2).toList(),
                  isAction: true,
                  isGram: false,
                ).paddingSymmetric(horizontal: 16),
                AppText(
                  Fonts.discover.tr,
                  style: AppCss.soraBold16,
                ).paddingSymmetric(horizontal: 16),

                VSpace(12),

                _buildDiscoverGrid(),
                VSpace(16),
                AppText(
                  Fonts.waterLevel.tr,
                  style: AppCss.soraBold16,
                ).paddingSymmetric(horizontal: 16),
                VSpace(12),
                _buildWaterLevelCard(ctrl).paddingSymmetric(horizontal: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void scanTap() {
    Navigation.toNamed(RouteName.scanImage);
  }

  void addMeal() {
    Navigation.toNamed(RouteName.addFood);
  }

  void arrowLeft(HomeController ctrl) {
    ctrl.previousBack();
  }

  void arrowRight(HomeController ctrl) {
    ctrl.nextTap();
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader() {
    return Container(
      height: 204,
      color: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            Fonts.appName.tr,
            style: AppCss.soraSemiBold24.copyWith(color: AppColors.white),
          ),
          Row(
            children: [
              CommonClass.commonBgCircleIcon(
                AppSvg.frame,
              ).inkWell(onTap: () => scanTap()),

              HSpace(4),
              CommonClass.commonBgCircleIcon(AppSvg.bell),
              HSpace(16),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- DISCOVER SECTION ----------------
  Widget _buildDiscoverGrid() {
    final items = [
      (Fonts.walkingStep, "500 Steps", AppSvg.walkingStep),
      (Fonts.sleepingTime, "6h 30m", AppSvg.sleepingTime),
      (Fonts.workouts, "45 Mins", AppSvg.workouts),
      (Fonts.meditation, "1 Mins", AppSvg.meditation),
    ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 90,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, i) {
        final item = items[i];
        return _discoverCard(item.$1, item.$2, item.$3);
      },
    );
  }

  Widget _discoverCard(String title, String value, String icon) {
    return CommonClass.commonContainerClass(
      padding: const EdgeInsets.all(12),
       Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  HSpace(5),
                  AppText(title.tr, style: AppCss.soraRegular13),
                ],
              ),
              VSpace(11),
              Row(
                children: [
                  AppText(value.split(" ")[0], style: AppCss.soraMedium22),
                  HSpace(10),
                  AppText(
                    value.split(" ")[1],
                    style: title == Fonts.sleepingTime
                        ? AppCss.soraMedium22
                        : AppCss.soraRegular14,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          if (title == Fonts.workouts)
            SvgPicture.asset(
              AppSvg.addCircle,
            ).inkWell(onTap: () => Navigation.toNamed(RouteName.workout)),
        ],
      ),
    );
  }

  // ---------------- WATER LEVEL CARD ----------------
  Widget _buildWaterLevelCard(HomeController ctrl) {
    return CommonClass.commonContainerClass(
      radius: 14,
      isShadow :false,
      margin: EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
       Row(
        children: [
          ctrl.waterLevel == 0.0
              ? Image.asset(AppImages.waterLevel)
              : CustomPaint(
                  size: Size(62, 83),
                  painter: FuelTankCustomPainter(context, ctrl.waterLevel),
                ),
          SvgPicture.asset(AppSvg.line).paddingSymmetric(horizontal: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                    spacing: 5,
                    children: [
                      AppText(
                        ctrl.dailyGoal.toStringAsFixed(0),
                        style: AppCss.soraMedium22.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      AppText(
                        Fonts.ml.tr,
                        style: AppCss.soraRegular14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  )
                  .paddingSymmetric(horizontal: 12, vertical: 2)
                  .decorated(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.lightGrey, width: .5),
                  ),
              VSpace(5),
              CommonClass.waterLevelGoal(
                Fonts.dailyGoal,
                "${ctrl.dailyGoal.toStringAsFixed(0)} ${Fonts.ml.tr}",
                AppSvg.goal,
              ),
              VSpace(5),
              CommonClass.waterLevelGoal(
                Fonts.glass,
                ctrl.glass.toStringAsFixed(0),
                AppSvg.glass,
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.add_circle, color: Colors.brown, size: 28),
        ],
      ),
    );
  }
}
