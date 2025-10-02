import 'package:calorie_counter/widgets/common_tab/tab_layout.dart';

import '../../app_config.dart';

class CommonTab extends StatelessWidget {
  final int? currentIndex;
  final Function(int)? onTap;
  final List? list;
  const CommonTab({super.key, this.currentIndex, this.onTap, this.list});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppDimens.dimen20,
            vertical: AppDimens.dimen21),
        padding: const EdgeInsets.all(3),
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
            color: Get.theme.cardColor,
            borderRadius:
            const BorderRadius.all(Radius.circular(10))),
        child: Stack(
          children: [
            AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: currentIndex == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                    height: height * 0.1,
                    width: width / 2.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10)))),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list!
                    .asMap()
                    .entries
                    .map((e) => TabLayout(
                    data: e.value,
                    index: e.key,
                    selectedIndex: currentIndex,
                    onTap: () => onTap!(e.key)))
                    .toList())
          ],
        ));
  }
}
