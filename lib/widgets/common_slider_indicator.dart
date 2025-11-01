import '../app_config.dart';

class CommonSliderIndicator extends StatelessWidget {
  final double value;
  const CommonSliderIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 8,

        inactiveTrackColor: AppColors.lightGrey.withValues(
          alpha: .20,
        ),
        thumbColor: Colors.transparent,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 0.0,
        ),
      ),
      child: Slider(
        activeColor: AppColors.primaryColor,

        value: value,
        onChanged: (value) {},
        min: 0,
        max: 4000,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
