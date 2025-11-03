
import 'package:carousel_slider/carousel_slider.dart';

import '../app_config.dart';

class NumberCarousel extends StatefulWidget {
  final double currentVal;
  final double min;
  final double max;
  final double step;
  final int totalItems;
  final int currentIndex;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final Function(int index)? onTap;

  final Function(double)? onValueChanged;
  final List<double> numbers;
  final CarouselSliderController carouselSliderController;

  const NumberCarousel({
    super.key,
    required this.currentVal,
    this.min = 20.0,
    this.max = 100.0,
    this.step = 0.5,
    this.onValueChanged,
    required this.carouselSliderController,
    required this.currentIndex,
    required this.numbers,
    this.onPageChanged, required this.totalItems, this.onTap,
  });

  @override
  State<NumberCarousel> createState() => _NumberCarouselState();
}

class _NumberCarouselState extends State<NumberCarousel> {
  late double selectedValue;

  // Constants for sizing
  static const double selectedHeight = 109.0;
  static const double selectedWidth = 100.0;
  static const double unselectedHeight = 67.0;
  static const double unselectedWidth = 88.0;

  @override
  void initState() {
    super.initState();

    selectedValue = widget.currentVal;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: selectedHeight,
        /* child: CarouselSlider.builder(
        carouselController: widget.carouselSliderController,
        itemCount: widget.numbers.length,
        itemBuilder: (context, index, realIndex) {
          final num = widget.numbers[index];
          final isSelected = index == widget.currentIndex;

          // Calculate distance from center for side items
          final distance = (index - widget.currentIndex).abs();

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isSelected ? selectedHeight : unselectedHeight,
            width: isSelected ? selectedWidth : unselectedWidth,
            padding: EdgeInsets.symmetric(horizontal: isSelected ? 21 : 13),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.lightGrey,
                width: 1.3,
              ),
            ),
            child: Center(
              child: Text(
                num.toStringAsFixed(0),
                style: isSelected
                    ? AppCss.soraMedium40.copyWith(color: AppColors.black)
                    : AppCss.soraMedium20.copyWith(color: AppColors.gary),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: selectedHeight,
          viewportFraction: 0.3,
          // Adjust to show side items
          enlargeCenterPage: true,
          enlargeFactor: 0.26,
          enableInfiniteScroll: false,
          initialPage: widget.currentIndex,
          onPageChanged: widget.onPageChanged,
        ),
      ),*/
        child: CarouselSlider.builder(
          carouselController: widget.carouselSliderController,
          itemCount: widget.numbers.length,
          itemBuilder: (context, index, realIndex) {
            final num = widget.numbers[index];
            final isSelected = realIndex == widget.currentIndex;

            return GestureDetector(
                onTap: () {
                  widget.onTap!(index);
                  // _carouselController.animateToPage(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: isSelected ? selectedHeight : unselectedHeight,
                  width: isSelected ? selectedWidth : unselectedWidth,
                  padding: EdgeInsets.symmetric(horizontal: isSelected ? 20 : 13),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.lightGrey,
                      width: 1.3,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      num.toStringAsFixed(0),
                      style: isSelected
                          ? AppCss.soraMedium40.copyWith(color: AppColors.black)
                          : AppCss.soraMedium20.copyWith(color: AppColors.gary),
                    ),
                  ),
                ));
          },
          options: CarouselOptions(
            height: selectedHeight,
            viewportFraction: 0.32,
            // Adjust to show side items
            enlargeCenterPage: true,
            enlargeFactor: 0.26,
            enableInfiniteScroll: false,
            initialPage: widget.currentIndex,
            onPageChanged: widget.onPageChanged,
          ),
        )
    );
  }
}
