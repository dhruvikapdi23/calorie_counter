import '../app_config.dart';
import '../modules/auth_screens/user_info_screen/layouts/weight_selection.dart';

class CommonUserTab extends StatelessWidget {
  final List<String> tabOption;
  const CommonUserTab({super.key, required this.tabOption});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
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
            ...tabOption.map((e) => TabItem(title: e),)
            ,
          ],
        ),
      ),
    );
  }
}
