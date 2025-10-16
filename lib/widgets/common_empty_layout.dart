import '../app_config.dart';

class CommonEmptyLayout extends StatelessWidget {
  final String title,desc;
  const CommonEmptyLayout({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.noData, height: 107),
          VSpace(18),
          Text(title.tr, style: AppCss.soraMedium16),
          VSpace(8),
          Text(
            desc.tr,
            textAlign: TextAlign.center,
            style: AppCss.soraLight12.copyWith(
              color: AppColors.black.withValues(alpha: .80),
            ),
          ).paddingSymmetric(horizontal: 87),
        ],
      ),
    );
  }
}
