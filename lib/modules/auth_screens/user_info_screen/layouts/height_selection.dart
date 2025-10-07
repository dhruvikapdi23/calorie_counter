import 'dart:developer';
import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';

import '../../../../app_config.dart';
import '../../../../widgets/feet_ruler_scaler.dart';
import '../../../../widgets/number_carosuel.dart';
import '../../../../widgets/ruler_scaler.dart';

class HeightSelection extends StatefulWidget {
  const HeightSelection({super.key});

  @override
  State<HeightSelection> createState() => _HeightSelectionState();
}

class _HeightSelectionState extends State<HeightSelection> {
  double _currentWeight = 5.5; // Initial value
  final RulerScaleController _weightRulerController = RulerScaleController();
  late CarouselSliderController _carouselController;
  late int currentIndex;
  late List<double> numbers;
  final double min =2.0;
  final double max =10.0;
  late int _totalItems;


  @override
  void initState() {
    // TODO: implement initState
    _carouselController = CarouselSliderController();
    // Generate numbers based on min, max, and step
    final totalItems = ((max - min) / 1).round() + 1;
    _totalItems = totalItems;
    numbers = List.generate(totalItems, (index) => min + (index * 1));

    currentIndex = numbers.indexOf(_currentWeight);

    // Jump to initial value after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentIndex >= 0 && currentIndex < numbers.length) {
        _carouselController.jumpToPage(currentIndex!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Container(
                height: 51,
                margin: const EdgeInsets.symmetric(horizontal: 72),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey),
        
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: AppColors.white,
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  labelColor: AppColors.white,
                  labelStyle: AppCss.soraSemiBold18,
                  unselectedLabelStyle: AppCss.soraSemiBold18,
                  unselectedLabelColor: AppColors.lightGrey,
                  tabs: [
                    TabItem(title: 'Ft'),
                    TabItem(title: 'Cm'),
                  ],
                ),
              ),
            ),
            VSpace(40),
            NumberCarousel(
              currentVal: _currentWeight,
              totalItems: _totalItems,
              currentIndex: currentIndex,
              carouselSliderController: _carouselController,
              min: min,
              max: max,
              numbers: numbers,
              onTap: (index) {
                _carouselController.animateToPage(index);
              },
              onPageChanged: (index, reason) {
                _weightRulerController.jumpToValue(min + index * 1);
        
                log("_currentWeight :$_currentWeight");
                WidgetsBinding.instance.addPostFrameCallback((_) {
                });
                setState(() {
                  currentIndex = index;
                });
                
        
              },
            ),
            VSpace(25),
            FeetRulerScale(
              direction: Axis.horizontal,
              minValue: 2.0,
              maxValue: 10.0,
              majorTickInterval: 0.5, // Show major ticks every 1 unit
              //minorTickInterval: 0.1, // Show minor ticks every 0.1 unit (for decimals)
              selectedTickLength: 65,
              majorTickLength: 37,
              minorTickLength: 27,
              unitSpacing: 40.0,
              initialValue: _currentWeight, // Your initial value, e.g., 5.5
              minorTickColor: AppColors.gary,
              majorTickColor: AppColors.gary,
              selectedTickColor: AppColors.black,
              step: 0.1, // This allows increments of 0.1 (5.2, 5.3, 5.4, etc.)
              rulerExtent: 150.0,
              labelStyle: AppCss.soraMedium18.copyWith(color: AppColors.black),
              onValueChanged: (value) {
                setState(() {
                  log("_currentWeight :$_currentWeight");
                  _currentWeight = value;
                  currentIndex = numbers.indexOf(_currentWeight);
                  // Jump to initial value after build
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (currentIndex >= 0 && currentIndex < numbers.length) {
                      _carouselController.jumpToPage(currentIndex!);
                    }
                  });
                });
              },

              labelOffset: 55.0, // Adjust label offset if needed
            ),
            VSpace(29),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white.withValues(alpha: .05),
                    offset: Offset(0, 10),
                    blurRadius: 20
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Fonts.yourCurrentWeight.tr,style: AppCss.soraSemiBold18),
                  VSpace(6),
                  Text(_currentWeight.toStringAsFixed(1),style: AppCss.soraBold28.copyWith(color: AppColors.primaryColor)),
                  VSpace(10),
                  Text(Fonts.lookingStringAndConfident.tr,style: AppCss.soraRegular14),
                ],
              ),
            )
          ],
        ).paddingOnly(top: 34),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;

  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(child: Text(title, overflow: TextOverflow.ellipsis));
  }
}

class _FeetRulerPainter extends CustomPainter {
  final double minFeet;
  final double maxFeet;
  final double unitSpacing;

  _FeetRulerPainter({
    required this.minFeet,
    required this.maxFeet,
    required this.unitSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint tickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.2;

    final TextStyle labelStyle = const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    const double baseLineY = 50;
    const double labelOffset = 6;

    // total inches across full range
    final int totalInches = ((maxFeet - minFeet) * 12).round();

    for (int i = 0; i <= totalInches; i++) {
      final double valueInFeet = minFeet + i / 12.0;
      final double x = i * unitSpacing;

      // tick type
      bool isMajorTick = (i % 12 == 0); // full foot
      bool isMidTick = (i % 6 == 0); // half foot

      final double tickHeight = isMajorTick
          ? 25
          : isMidTick
          ? 18
          : 10;

      // draw tick
      canvas.drawLine(
        Offset(x, baseLineY - tickHeight),
        Offset(x, baseLineY),
        tickPaint,
      );

      // draw label (for every inch)
      int feet = valueInFeet.floor();
      int inches = ((valueInFeet - feet) * 12).round();
      if (inches == 12) {
        feet += 1;
        inches = 0;
      }

      final String label = "$feet'${inches.toString()}";

      final textPainter = TextPainter(
        text: TextSpan(text: label, style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        Offset(
          x - textPainter.width / 2,
          baseLineY + labelOffset,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}