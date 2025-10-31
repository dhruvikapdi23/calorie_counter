import 'dart:math';
import 'dart:math' as math;

import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:intl/intl.dart';

import '../../module_screens/search_screen/layouts/all_search_list.dart';
import 'home_controller.dart';

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
                Stack(
                  children: [
                    _buildHeader(),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 147),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: .05),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            spacing: 9,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Today,${DateFormat("MMM dd").format(DateTime.now())} ",
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
                          VSpace(12),

                          CommonEatenChart(),
                        ],
                      ),
                    ),
                  ],
                ),

                VSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Fonts.addMeal.tr, style: AppCss.soraBold16),
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
                          Text(
                            Fonts.add.tr,
                            style: AppCss.soraRegular13.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ).inkWell(onTap: ()=>addMeal())
                  ],
                ).paddingSymmetric(horizontal: 16),
                VSpace(12),

                AllSearchList(
                  list: AppArray.foodItems.getRange(0, 2).toList(),
                  isAction: true,
                  isGram: false,
                ).paddingSymmetric(horizontal: 16),
                Text(
                  Fonts.discover.tr,
                  style: AppCss.soraBold16,
                ).paddingSymmetric(horizontal: 16),

                VSpace(12),

                _buildDiscoverGrid(),
                VSpace(16),
                Text(
                  Fonts.waterLevel.tr,
                  style: AppCss.soraBold16,
                ).paddingSymmetric(horizontal: 16),
                VSpace(12),
                _buildWaterLevelCard().paddingSymmetric(horizontal: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void scanTap() {
    Get.toNamed(RouteName.scanImage);
  }


  void addMeal() {
    Get.toNamed(RouteName.addFood);
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
          Text(
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

  Widget _iconStat(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: Colors.brown, size: 26),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 2),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _circleMacro(String label, String value, String target) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12, width: 2),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                target,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: .05),
            offset: Offset(0, 10),
            blurRadius: 20,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  HSpace(5),
                  Text(title.tr, style: AppCss.soraRegular13),
                ],
              ),
              VSpace(11),
              Row(
                children: [
                  Text(value.split(" ")[0],style: AppCss.soraMedium22,),
                  HSpace(10),
                  Text(value.split(" ")[1],style:title ==Fonts.sleepingTime? AppCss.soraMedium22:AppCss.soraRegular14),
                ],
              )
            ],
          ),
          const Spacer(),
          if (title == Fonts.workouts) SvgPicture.asset(AppSvg.addCircle),
        ],
      ),
    );
  }

  // ---------------- WATER LEVEL CARD ----------------
  Widget _buildWaterLevelCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CustomPaint(
            size: Size(62,83),
            painter: FuelTankCustomPainter(context,.1),),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "0 ml",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Text("Daily Goal: 0 ml", style: TextStyle(color: Colors.black54)),
              Text("Glass: 0", style: TextStyle(color: Colors.black54)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.add_circle, color: Colors.brown, size: 28),
        ],
      ),
    );
  }

  // ---------------- CALORIE SUMMARY ----------------
  Widget _buildCalorieCard() {
    return const SizedBox.shrink(); // handled in header
  }
}
class FuelTankCustomPainter extends CustomPainter {
  FuelTankCustomPainter(this.context, this.value);

  final BuildContext context;
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    // assuming the original design width is 180 (width scale)
    double ws = size.width / 180;
    // assuming the original design height is 216 (height scale)
    double hs = size.height / 216;

    Path bgPath = Path();
    bgPath.moveTo(82.9262 * ws, 16.5416 * hs);
    bgPath.cubicTo(
      84.9174 * ws,
      14.8986 * hs,
      87.4185 * ws,
      14 * hs,
      90 * ws,
      14 * hs,
    );
    bgPath.cubicTo(
      92.5816 * ws,
      14 * hs,
      95.0826 * ws,
      14.8986 * hs,
      97.0738 * ws,
      16.5416 * hs,
    );
    bgPath.cubicTo(
      110.61 * ws,
      27.7963 * hs,
      123.011 * ws,
      40.3491 * hs,
      134.101 * ws,
      54.0205 * hs,
    );
    bgPath.cubicTo(
      149.548 * ws,
      73.2261 * hs,
      165.353 * ws,
      99.2889 * hs,
      165.353 * ws,
      126.548 * hs,
    );
    bgPath.cubicTo(
      165.353 * ws,
      146.533 * hs,
      157.414 * ws,
      165.699 * hs,
      143.283 * ws,
      179.831 * hs,
    );
    bgPath.cubicTo(
      129.151 * ws,
      193.962 * hs,
      109.985 * ws,
      201.901 * hs,
      90 * ws,
      201.901 * hs,
    );
    bgPath.cubicTo(
      70.0151 * ws,
      201.901 * hs,
      50.8487 * ws,
      193.962 * hs,
      36.7172 * ws,
      179.831 * hs,
    );
    bgPath.cubicTo(
      22.5857 * ws,
      165.699 * hs,
      14.6467 * ws,
      146.533 * hs,
      14.6467 * ws,
      126.548 * hs,
    );
    bgPath.cubicTo(
      14.6467 * ws,
      99.2889 * hs,
      30.4521 * ws,
      73.2261 * hs,
      45.8995 * ws,
      54.011 * hs,
    );
    bgPath.cubicTo(
      56.9867 * ws,
      40.3435 * hs,
      69.3943 * ws,
      27.7939 * hs,
      82.9262 * ws,
      16.5416 * hs,
    );
    bgPath.close();

    Paint bgFill = Paint()..style = PaintingStyle.fill;
    bgFill.color = Color(value >0.0? 0xFFBCECFF:0XFFFFFF);
    canvas.drawPath(bgPath, bgFill);

    // Calculate the fuel level height
    double fuelLevelHeight = 200 - (200 * value);

    Path behindDrop = Path();
    behindDrop.moveTo(170.377 * ws, fuelLevelHeight * hs);
    behindDrop.cubicTo(
      170.377 * ws,
      173.014 * hs,
      134.391 * ws,
      200 * hs,
      90 * ws,
      200 * hs,
    );
    behindDrop.cubicTo(
      45.6089 * ws,
      200 * hs,
      9.62317 * ws,
      173.014 * hs,
      9.62317 * ws,
      fuelLevelHeight * hs,
    );
    behindDrop.cubicTo(
      9.62317 * ws,
      fuelLevelHeight * hs,
      52.4908 * ws,
      148.273 * hs,
      90 * ws,
      fuelLevelHeight * hs,
    );
    behindDrop.cubicTo(
      132.868 * ws,
      108.084 * hs,
      170.377 * ws,
      fuelLevelHeight * hs,
      160.377 * ws,
      fuelLevelHeight * hs,
    );
    behindDrop.close();

    Paint behindDropFill = Paint()..style = PaintingStyle.fill;
    behindDropFill.color =  Color(value >0.0? 0xff5EBEF6:0XFFFFFF);
    canvas.drawPath(behindDrop, behindDropFill);

    Path upperDrop = Path();
    upperDrop.moveTo(9.62317 * ws, fuelLevelHeight * hs);
    upperDrop.cubicTo(
      9.62317 * ws,
      173.014 * hs,
      45.609 * ws,
      200 * hs,
      90 * ws,
      200 * hs,
    );
    upperDrop.cubicTo(
      134.391 * ws,
      200 * hs,
      170.377 * ws,
      173.014 * hs,
      170.377 * ws,
      fuelLevelHeight * hs,
    );
    upperDrop.cubicTo(
      135.377 * ws,
      fuelLevelHeight * hs,
      124.83 * ws,
      148.271 * hs,
      90 * ws,
      fuelLevelHeight * hs,
    );
    upperDrop.cubicTo(
      53.5869 * ws,
      108.084 * hs,
      9.62317 * ws,
      fuelLevelHeight * hs,
      20.62317 * ws ,
      (fuelLevelHeight * hs),
    );
    upperDrop.close();

    Paint upperDropFill = Paint()..style = PaintingStyle.fill;
    //upperDropFill.color =  Colors.black;
    upperDropFill.color =  Color(value >0.0? 0xff71CAFA:0XFFFFFF);
    canvas.drawPath(upperDrop, upperDropFill);

    Path borderPath = Path();
    borderPath.moveTo(73.9955 * ws, 5.75999 * hs);
    borderPath.lineTo(74.0161 * ws, 5.74307 * hs);
    borderPath.cubicTo(
      78.5154 * ws,
      2.03053 * hs,
      84.1668 * ws,
      0,
      90 * ws,
      0,
    );
    borderPath.cubicTo(
      95.8333 * ws,
      0,
      101.485 * ws,
      2.03053 * hs,
      105.984 * ws,
      5.74307 * hs,
    );
    borderPath.lineTo(106.004 * ws, 5.75986 * hs);
    borderPath.lineTo(106.025 * ws, 5.77673 * hs);
    borderPath.cubicTo(
      120.263 * ws,
      17.6156 * hs,
      133.308 * ws,
      30.82 * hs,
      144.973 * ws,
      45.201 * hs,
    );
    borderPath.lineTo(144.992 * ws, 45.2235 * hs);
    borderPath.lineTo(145.01 * ws, 45.2461 * hs);
    borderPath.cubicTo(
      160.937 * ws,
      65.0484 * hs,
      179.353 * ws,
      94.3099 * hs,
      179.353 * ws,
      126.548 * hs,
    );
    borderPath.cubicTo(
      179.353 * ws,
      150.246 * hs,
      169.939 * ws,
      172.973 * hs,
      153.182 * ws,
      189.73 * hs,
    );
    borderPath.cubicTo(
      136.425 * ws,
      206.487 * hs,
      113.698 * ws,
      215.901 * hs,
      90 * ws,
      215.901 * hs,
    );
    borderPath.cubicTo(
      66.302 * ws,
      215.901 * hs,
      43.5747 * ws,
      206.487 * hs,
      26.8177 * ws,
      189.73 * hs,
    );
    borderPath.cubicTo(
      10.0607 * ws,
      172.973 * hs,
      0.646729 * ws,
      150.246 * hs,
      0.646729 * ws,
      126.548 * hs,
    );
    borderPath.cubicTo(
      0.646729 * ws,
      94.3101 * hs,
      19.0631 * ws,
      65.0486 * hs,
      34.9882 * ws,
      45.2392 * hs,
    );
    borderPath.lineTo(35.0076 * ws, 45.2152 * hs);
    borderPath.lineTo(35.027 * ws, 45.1912 * hs);
    borderPath.cubicTo(
      46.6919 * ws,
      30.8115 * hs,
      59.7435 * ws,
      17.611 * hs,
      73.9751 * ws,
      5.777 * hs,
    );
    borderPath.lineTo(73.9955 * ws, 5.75999 * hs);
    borderPath.close();
    borderPath.moveTo(97.0738 * ws, 16.5416 * hs);
    borderPath.cubicTo(
      95.0826 * ws,
      14.8986 * hs,
      92.5816 * ws,
      14 * hs,
      90 * ws,
      14 * hs,
    );
    borderPath.cubicTo(
      87.4185 * ws,
      14 * hs,
      84.9174 * ws,
      14.8986 * hs,
      82.9262 * ws,
      16.5416 * hs,
    );
    borderPath.cubicTo(
      69.3943 * ws,
      27.7939 * hs,
      56.9867 * ws,
      40.3435 * hs,
      45.8995 * ws,
      54.011 * hs,
    );
    borderPath.cubicTo(
      30.4521 * ws,
      73.2261 * hs,
      14.6467 * ws,
      99.2889 * hs,
      14.6467 * ws,
      126.548 * hs,
    );
    borderPath.cubicTo(
      14.6467 * ws,
      146.533 * hs,
      22.5857 * ws,
      165.699 * hs,
      36.7172 * ws,
      179.831 * hs,
    );
    borderPath.cubicTo(
      50.8487 * ws,
      193.962 * hs,
      70.0151 * ws,
      201.901 * hs,
      90 * ws,
      201.901 * hs,
    );
    borderPath.cubicTo(
      109.985 * ws,
      201.901 * hs,
      129.151 * ws,
      193.962 * hs,
      143.283 * ws,
      179.831 * hs,
    );
    borderPath.cubicTo(
      157.414 * ws,
      165.699 * hs,
      165.353 * ws,
      146.533 * hs,
      165.353 * ws,
      126.548 * hs,
    );
    borderPath.cubicTo(
      165.353 * ws,
      99.2889 * hs,
      149.548 * ws,
      73.2261 * hs,
      134.101 * ws,
      54.0205 * hs,
    );
    borderPath.cubicTo(
      123.011 * ws,
      40.3491 * hs,
      110.61 * ws,
      27.7963 * hs,
      97.0738 * ws,
      16.5416 * hs,
    );
    borderPath.close();

    Paint borderFill = Paint()..style = PaintingStyle.fill;
    borderFill.color = Color(value > 0.0 ?  0XFF96E2FF:0xFFF5F5F5);
    canvas.drawShadow(
      borderPath,
      context.theme.dividerColor.withOpacity(0.3),
      15.0,
      true,
    );
    canvas.drawPath(borderPath, borderFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

