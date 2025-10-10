import '../../../../app_config.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String duration;
  final bool isSelected;
  final String? tagText;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.duration,
    required this.isSelected,
    required this.onTap,
    this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.primaryColor;
    final inactiveColor = AppColors.lightGrey;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.primaryColor.withValues(alpha: .30)
                    : Colors.transparent,
                width: 3,
              ),
            ),
            child: AnimatedContainer(
              width: MediaQuery.sizeOf(context).width,
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? activeColor : inactiveColor,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Price Text
                  RichText(
                    text: TextSpan(
                      text: price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: duration,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 17,
              height: 17,
              margin: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? activeColor : Colors.white,
                border: Border.all(
                  color: isSelected ? activeColor : inactiveColor,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? SvgPicture.asset(AppSvg.tick1).paddingAll(3)
                  : null,
            ),
          ),
          // Tag badge (if any)
          if (tagText != null)
            Positioned(
              top: -12,
              left: 21,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tagText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
