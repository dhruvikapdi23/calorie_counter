import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title, versionCode;
  final bool isBack;
  final List<Widget>? actions;
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;

  const CommonAppBar(
      {super.key,
      this.title,
      this.isBack = false,
      this.actions,
      this.versionCode,
      this.onTap, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leadingWidth: AppDimens.dimen60,
      automaticallyImplyLeading: false,
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      leading: isBack
          ? SvgPicture.asset(AppSvg.arrowLeft,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                      Get.theme.iconTheme.color!, BlendMode.srcIn))
              .inkWell(onTap: onTap ?? () => Get.back())
          : null,
      actions: actions,
      title: Column(
        children: [
          Text(title!.tr,
              style: textStyle?? Get.theme.textTheme.displaySmall!.copyWith(
                fontFamily: GoogleFonts.mulish().fontFamily,
                  fontSize: FontDimen.dimen24, fontWeight: FontWeight.w700)),
          if (versionCode != null)
            Text(versionCode!,
                    style: Get.theme.textTheme.displayMedium!
                        .copyWith(fontSize: 14, color: Get.theme.primaryColor))
                .paddingOnly(top: AppDimens.dimen5),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(90);
}
