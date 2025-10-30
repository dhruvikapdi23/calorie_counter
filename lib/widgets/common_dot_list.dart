import '../app_config.dart';

class CommonDotList extends StatelessWidget {
  final List array;
  final int currentStep;
  const CommonDotList({super.key, required this.array, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Align(

      alignment: Alignment.center,
      child: SizedBox(
        height: 7,

        child: ListView.separated(scrollDirection: Axis.horizontal,
          itemCount: array.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(width: 4),

          itemBuilder: (context, index) => Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: currentStep == index
                  ? AppColors.primaryColor
                  : AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: currentStep == index
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: .40),
                width: .5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
