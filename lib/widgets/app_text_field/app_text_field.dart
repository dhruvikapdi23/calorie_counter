import 'dart:developer';

import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? tag;
  final double? height, bRadius;
  final bool isAuth, isEmpty;
  final String img;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle? hintStyle, labelStyle;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final bool? isDense;
  final TextInputType? keyboardType;
  final bool obscureText,autoValidate;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? minLine;
  final Color? color, bColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final Function()? onTap;
  final bool readOnly;
  final bool enabled;
  final String? counterText;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField(
      {super.key,
        this.labelText,
        this.hintText,
        this.tag,
        this.height = 45,
        this.isAuth = false,
        this.isEmpty = false,
        this.autoValidate = true,
        this.img = '',
        this.controller,
        this.focusNode,
        this.labelStyle,
        this.hintStyle,
        this.contentPadding,
        this.style,
        this.suffixIcon,
        this.keyboardType,
        this.minLine,
        this.obscureText = false,
        this.maxLines = 1,
        this.onChanged,
        this.validator,
        this.maxLength,
        this.color,
        this.textAlign,
        this.borderRadius,
        this.prefixIcon,
        this.onTap,
        this.readOnly = false,
        this.isDense,
        this.enabled = true,
        this.counterText,
        this.inputFormatters,
        this.bRadius,
        this.bColor});

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          bRadius ?? 5.23,
        ),
        borderSide: BorderSide(color: bColor ?? AppColors.white));

    return GetBuilder<TextFieldController>(
      init: TextFieldController()..setData(obscureText),
      tag: tag ?? (hintText ?? 'field'),
      builder: (controller1) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (labelText != null)
                Text(labelText!,
                    style: labelStyle ??
                        Get.theme.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.mulish().fontFamily,
                            fontSize: 14.64,
                            color: AppColors.black))
                    .marginOnly(bottom: AppDimens.dimen9),
              Theme(
                  data: ThemeData(canvasColor: AppColors.white),
                  child: TextFormField(
                      maxLines: maxLines,
                      onTap: onTap,
                      controller: controller,
                      focusNode: focusNode,
                      textAlign: TextAlign.start,
                      style: style ?? Get.theme.textTheme.titleMedium,
                      cursorColor: Get.theme.primaryColor,
                      obscuringCharacter: '*',
                      obscureText: obscureText,
                      validator: validator,
                      readOnly: readOnly,
                      minLines: minLine??null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: keyboardType ?? TextInputType.text,
                      onChanged: onChanged,
                      maxLength: maxLength,

                      decoration: InputDecoration(
                          counterText: counterText,
                          fillColor:color?? AppColors.white,
                          filled: true,
                          isDense: true,
                          disabledBorder: inputBorder,
                          focusedBorder: inputBorder,
                          counter: const SizedBox.shrink(),
                          enabledBorder: inputBorder,
                          errorBorder: inputBorder,
                          focusedErrorBorder: inputBorder,
                          border: inputBorder,
                          suffixIconConstraints: const BoxConstraints(
                              minWidth: 24, maxHeight: 24),
                          contentPadding:contentPadding?? const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 9),
                          suffixIcon: suffixIcon,
                          prefixIcon: prefixIcon,
                          hintText: hintText,
                          hintStyle: hintStyle ??
                              AppCommonLayout().mulishFW400Or500TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.gary),
                          errorMaxLines: 2))),

            ]);
      },
    );
  }
}

/*

import 'dart:developer';

import 'package:calorie_counter/app_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? tag;
  final double? height, bRadius;
  final bool isAuth, isEmpty;
  final String img;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle? hintStyle, labelStyle;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final bool? isDense;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Color? color, bColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final Function()? onTap;
  final bool readOnly;
  final bool enabled;
  final String? counterText;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField(
      {super.key,
        this.labelText,
        this.hintText,
        this.tag,
        this.height = 45,
        this.isAuth = false,
        this.isEmpty = false,
        this.img = '',
        this.controller,
        this.focusNode,
        this.labelStyle,
        this.hintStyle,
        this.contentPadding,
        this.style,
        this.suffixIcon,
        this.keyboardType,
        this.obscureText = false,
        this.maxLines = 1,
        this.onChanged,
        this.validator,
        this.maxLength,
        this.color,
        this.textAlign,
        this.borderRadius,
        this.prefixIcon,
        this.onTap,
        this.readOnly = false,
        this.isDense,
        this.enabled = true,
        this.counterText,
        this.inputFormatters,
        this.bRadius,
        this.bColor});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFieldController>(
      init: TextFieldController()..setData(obscureText),
      tag: tag ?? (hintText ?? 'field'),
      builder: (controller1) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (labelText != null)
                Text(labelText!,
                    style: labelStyle ??
                        Get.theme.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.mulish().fontFamily,
                            fontSize: 14.64,
                            color: AppColors.blackLabelColor))
                    .marginOnly(bottom: AppDimens.dimen9),
              Container(
                width: double.infinity,
                height: height,
                decoration: AppDecoration.textBoxDecoration(
                    color: color ?? Get.theme.scaffoldBackgroundColor,
                    radius: bRadius ?? 5.23,
                    bColor: bColor ?? AppColors.borderColor),
                child: Center(
                    child: TextFormField(
                        maxLines: maxLines,
                        onTap: onTap,
                        controller: controller,
                        focusNode: focusNode,
                        textAlign: TextAlign.start,
                        style: style ?? Get.theme.textTheme.titleMedium,
                        cursorColor: Get.theme.primaryColor,
                        obscuringCharacter: '*',
                        obscureText: obscureText,
                        keyboardType: keyboardType ?? TextInputType.text,
                        onChanged: onChanged,
                        validator: (value) {
                          if (validator != null) {
                            Future.delayed(Duration.zero, () {
                              controller1.validatorMsg.value = validator!.call(value!) ?? "";
                            });
                            // controller1.update();
                          }
                          log("validator!.call(valu) :${controller1.validatorMsg!.value}");
                          return controller1.validatorMsg.value;
                        },
                        maxLength: maxLength,
                        readOnly: readOnly,
                        enabled: enabled,
                        inputFormatters: inputFormatters,
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: hintStyle ??
                                AppCommonLayout().mulishFW400Or500TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightGreyColor),
                            isDense: isDense,
                            counterText: counterText,
                            suffixIcon: suffixIcon,
                            prefixIcon: prefixIcon,
                            suffixIconConstraints: const BoxConstraints(
                                minWidth: 24, maxHeight: 24),
                            contentPadding: contentPadding ??
                                const EdgeInsets.only(bottom: 5),
                            border: InputBorder.none,
                            errorText: '',
                            errorStyle: const TextStyle(
                                fontSize: 0, color: AppColors.primaryColor),
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none))
                        .paddingOnly(left: 13)),
              ),
              Obx(() => controller1.validatorMsg.value !=""? Text(controller1.validatorMsg.value.toString().tr,
                  style: Get.theme.textTheme.titleSmall
                      ?.copyWith(color: AppColors.redColor))
                  .paddingOnly(top: AppDimens.dimen6, left: AppDimens.dimen14):Container())
            ]);
      },
    );
  }
}
*/
