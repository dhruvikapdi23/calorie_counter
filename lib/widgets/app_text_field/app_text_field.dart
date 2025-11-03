

import 'package:calorie_counter/app_config.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? tag;
  final double? height, bRadius,bottomSpace;
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
        this.bottomSpace,
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
        borderSide: BorderSide(color: bColor ?? AppColors.strokeColor));

    return GetBuilder<TextFieldController>(
      init: TextFieldController()..setData(obscureText),
      tag: tag ?? (hintText ?? 'field'),
      builder: (controller1) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (labelText != null)
                Text(labelText!.tr,
                    style: labelStyle ??
                       AppCss.soraRegular14.copyWith(color: AppColors.black1))
                    .marginOnly(bottom:bottomSpace?? AppDimens.dimen8),
              Theme(
                  data: ThemeData(canvasColor: AppColors.white),
                  child: TextFormField(
                      maxLines: maxLines,
                      onTap: onTap,
                      controller: controller,
                      focusNode: focusNode,
                      textAlign: TextAlign.start,
                      style: style ?? AppCss.soraRegular14.copyWith(color: AppColors.primaryColor),
                      cursorColor: Get.theme.primaryColor,
                      obscuringCharacter: '*',
                      obscureText: obscureText,
                      validator: validator,
                      readOnly: readOnly,
                      minLines: minLine,
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
                         /* suffixIconConstraints: const BoxConstraints(
                              minWidth: 30, maxHeight: 30),*/
                          contentPadding:contentPadding?? const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 14),
                          suffixIcon: suffixIcon,
                          prefixIcon: prefixIcon,
                          hintText: hintText?.tr,
                          hintStyle: hintStyle ??
                             AppCss.soraRegular12.copyWith(color: AppColors.gary),
                          errorMaxLines: 2))),

            ]);
      },
    );
  }
}
