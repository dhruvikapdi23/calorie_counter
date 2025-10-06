import 'dart:developer';
import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';

import '../../../../app_config.dart';
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
                    TabItem(title: 'Kg'),
                    TabItem(title: 'Lb'),
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
