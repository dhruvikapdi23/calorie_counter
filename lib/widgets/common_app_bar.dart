import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title, versionCode;
  final bool isBack;
  final List<Widget>? actions;
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;
  final bool bottomWidget;

  const CommonAppBar(
      {super.key,
      this.title,
      this.isBack = false,
      this.actions,
      this.versionCode,
      this.onTap, this.textStyle,this.bottomWidget =false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: 72,
      title: AppText(
        title!,
        style: AppCss.soraSemiBold24.copyWith(color: AppColors.white),
      ),
      bottom: bottomWidget? PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: AppTextField(
            color: AppColors.white,
            onTap: ()=> Navigation.toNamed(RouteName.search),

            bRadius: 12,
            hintText: Fonts.searchForAFoodItem.tr,
            hintStyle: AppCss.soraRegular14.copyWith(
              color: AppColors.gary,
            ),
            prefixIcon: SvgPicture.asset(
              AppSvg.search1,
            ).paddingSymmetric(horizontal: 14),
            suffixIcon: SvgPicture.asset(
              AppSvg.filter,
            ).paddingSymmetric(horizontal: 14),
          ),
        ),
      ):null,
      actions: [
        CommonClass.commonBgCircleIcon(
          AppSvg.frame,
        ).inkWell(onTap: () => onTap!()),

        HSpace(4),
        CommonClass.commonBgCircleIcon(AppSvg.bell),
        HSpace(16),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(bottomWidget?72:80);
}

class CommonLogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  const CommonLogoAppBar(
      {super.key,
      this.title,});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      automaticallyImplyLeading: false,
      title: title,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(56.0 );
}
