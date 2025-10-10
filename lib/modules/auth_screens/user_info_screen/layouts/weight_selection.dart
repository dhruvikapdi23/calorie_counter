import 'dart:developer';
import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';

import '../../../../app_config.dart';
import '../../../../widgets/common_tab.dart';
import '../../../../widgets/number_carosuel.dart';
import '../../../../widgets/ruler_scaler.dart';

class WeightSelection extends StatefulWidget {
  const WeightSelection({super.key});

  @override
  State<WeightSelection> createState() => _WeightSelectionState();
}

class _WeightSelectionState extends State<WeightSelection> {
  double _currentWeight = 70.0; // Initial value
  final RulerScaleController _weightRulerController = RulerScaleController();
  late CarouselSliderController _carouselController;
  late int currentIndex;
  late List<double> numbers;
  final double min =20.0;
  final double max =120.0;
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
            CommonUserTab(tabOption: AppArray.weightOption,),
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
            RulerScale(
              direction: Axis.horizontal,
              minValue: min,
              maxValue: max,
              majorTickInterval: 5.0,
              selectedTickLength: 65,
              majorTickLength: 37,controller: _weightRulerController,
              minorTickLength: 27,
              unitSpacing: 20.0,
              initialValue: _currentWeight,
              minorTickColor: AppColors.gary,
              majorTickColor: AppColors.gary,
              selectedTickColor: AppColors.black,
              labelFormatter: (value) => value.toStringAsFixed(1),
        
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
            CommonClass.commonWeightHeightTextLayout(context, Fonts.yourCurrentWeight.tr, _currentWeight.toStringAsFixed(1))

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
