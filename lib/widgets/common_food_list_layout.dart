import '../app_config.dart';

class CommonFoodListLayout extends StatelessWidget {
  final String image, name, weight, calories;
final Widget? actionWidget;
  const CommonFoodListLayout({
    super.key,
    required this.image,
    required this.name,
    required this.weight,
    required this.calories, this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: .05),
            offset: Offset(0, 10),
            blurRadius: 20,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              CommonImageLayout(
                height: 39,
                width: 39,
                borderRadius: 6,
                assetImage: image,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppCss.soraRegular13),
                  VSpace(6),
                  Row(
                    spacing: 14,
                    children: [
                      Row(
                        spacing: 4,
                        children: [
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.gary,
                            ),
                          ),
                          Text(
                            weight,
                            style: AppCss.soraRegular12.copyWith(
                              color: AppColors.gary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.gary,
                            ),
                          ),
                          Text(
                            calories,
                            style: AppCss.soraRegular12.copyWith(
                              color: AppColors.gary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        if(actionWidget != null )
          actionWidget!
        ],
      ),
    );
  }
}
