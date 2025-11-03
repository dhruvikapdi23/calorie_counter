import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../app_config.dart';

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
  final double min = 2.0;
  final double max = 10.0;
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
        _carouselController.jumpToPage(currentIndex);
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
            CommonUserTab(tabOption: AppArray.heightOption),

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
                WidgetsBinding.instance.addPostFrameCallback((_) {});
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
              majorTickInterval: 0.5,
              // Show major ticks every 1 unit
              //minorTickInterval: 0.1, // Show minor ticks every 0.1 unit (for decimals)
              selectedTickLength: 65,
              majorTickLength: 37,
              minorTickLength: 27,
              unitSpacing: 40.0,
              initialValue: _currentWeight,
              // Your initial value, e.g., 5.5
              minorTickColor: AppColors.gary,
              majorTickColor: AppColors.gary,
              selectedTickColor: AppColors.black,
              step: 0.1,
              // This allows increments of 0.1 (5.2, 5.3, 5.4, etc.)
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
                      _carouselController.jumpToPage(currentIndex);
                    }
                  });
                });
              },

              labelOffset: 55.0, // Adjust label offset if needed
            ),
            VSpace(29),
            CommonClass.commonWeightHeightTextLayout(
              context,
              Fonts.yourCurrentHeight.tr,
              _currentWeight.toStringAsFixed(1),
            ),
          ],
        ).paddingOnly(top: 34),
      ),
    );
  }
}
