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
              majorTickInterval: 1.0, // Show major ticks every 1 unit
              //minorTickInterval: 0.1, // Show minor ticks every 0.1 unit (for decimals)
              selectedTickLength: 65,
              majorTickLength: 37,
              minorTickLength: 27,
              unitSpacing: 20.0,
              initialValue: _currentWeight, // Your initial value, e.g., 5.5
              minorTickColor: AppColors.gary,
              majorTickColor: AppColors.gary,
              selectedTickColor: AppColors.black,
              labelFormatter: (value) => value.toStringAsFixed(1),
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
                  Text(_currentWeight.toStringAsFixed(2),style: AppCss.soraBold28.copyWith(color: AppColors.primaryColor)),
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
