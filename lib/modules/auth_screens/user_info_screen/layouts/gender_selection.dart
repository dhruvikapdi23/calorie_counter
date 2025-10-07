import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';

class GenderSelection extends StatelessWidget {
  final String? gender;
  final Function(String) onTap;

  const GenderSelection({super.key, this.gender, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 19,
      children: [
        ...AppArray.genderList.asMap().entries.map(
          (e) => Column(
            spacing: 10,
            children: [
              Container(
                height: 142,
                width: 142,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: gender == e.value['title']
                        ? AppColors.primaryColor
                        : AppColors.white,
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 126,
                  width: 126,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(e.value['image'].toString()),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(e.value['title'].toString(), style: AppCss.soraMedium20),
            ],
          ).inkWell(onTap: () => onTap(e.value['title'])),
        ),
      ],
    ).paddingOnly(top: 92);
  }
}
