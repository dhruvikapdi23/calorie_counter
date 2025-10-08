import 'package:calorie_counter/app_config.dart';

Widget appButton(String title,
    {Color? color,bColor,
    Color? textColor,
    double? width,
    double? height,
    Function()? onTap,
    TextStyle? style,
    BorderRadiusGeometry? borderRadius,
      Widget? icon,
    bool isShowBottom = true}) {
  return SizedBox(
    width: width ?? double.infinity,
    height: height ?? AppDimens.dimen52,
    child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: bColor?? Colors.transparent),
              borderRadius: borderRadius ??
                  BorderRadius.circular(AppDimens.dimen12), // <-- Radius
            ),
            disabledBackgroundColor: color ?? AppColors.black,
            backgroundColor: color ?? AppColors.black),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,

          children: [
            if(icon !=null)
            Row(
              children: [icon,const HSpace(9)],
            ),
            Text(
              title,
              style: style ??
                  AppCss.soraSemiBold16.copyWith(color: color??AppColors.white),
            ),
          ],
        )),
  );
}


Widget appButton1(String title,
    {Color? color,bColor,
    Color? textColor,
    double? width,
    double? height,
    Function()? onTap,
    TextStyle? style,
    BorderRadiusGeometry? borderRadius,
      Widget? icon,
    bool isShowBottom = true}) {
  return SizedBox(
    height: height,
    child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: bColor?? Colors.transparent),
              borderRadius: borderRadius ??
                  BorderRadius.circular(AppDimens.dimen8), // <-- Radius
            ),
            disabledBackgroundColor: color ?? AppColors.primaryColor,
            backgroundColor: color ?? AppColors.primaryColor),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,

          children: [
            if(icon !=null)
            Row(
              children: [icon,const HSpace(9)],
            ),
            Text(
              title,
              style: style ??
                  Get.theme.textTheme.displaySmall!
                      .copyWith(color: AppColors.white),
            ),
          ],
        )),
  );
}
