import 'package:calorie_counter/widgets/common_dot_list.dart';

import '../../../../app_config.dart';

class RowDiscoverOption extends StatelessWidget {
  final String title;
  final int currentStep;
  final List array;
  const RowDiscoverOption({super.key, required this.title, required this.currentStep, required this.array});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppCss.soraSemiBold16),
        VSpace(16),
        SizedBox(
          height: 148,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: array.length,  separatorBuilder: (context, index) => const SizedBox(width: 12),

            itemBuilder: (context, index) {
              dynamic data = array[index];
              return Container(
                width: 179,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 99,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),

                        image: DecorationImage(
                            image: AssetImage(data['image']),
                            fit: BoxFit.cover

                        ),
                      ),
                    ),
                    VSpace(9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data['title'],style: AppCss.soraMedium12),
                        SvgPicture.asset(AppSvg.export)
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
        VSpace(16),
        CommonDotList(array: array, currentStep: currentStep)
      ],
    );
  }
}
