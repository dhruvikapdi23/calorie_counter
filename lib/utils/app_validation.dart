
import 'package:calorie_counter/app_config.dart';

class AppValidation {
  String? validatesEmail(String? value) {
    String pattern =
        r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})([ ]{0,10})$";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return Fonts.fieldIsRequired.tr;
    } else if (!regExp.hasMatch(value)) {
      return Fonts.validateEmailMsg.tr;
    } else if (value.contains(" ")) {
      return Fonts.validateEmailMsg.tr;
    }
    return null;
  }

  String? validatesPassword(String? value) {

    String pattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return Fonts.fieldIsRequired.tr;
    } else if (!regExp.hasMatch(value)) {
      return Fonts.validatePasswordMsg.tr;
    }
    return null;
  }


  String? signInValidatesPassword(String? value) {
    if (value!.isEmpty) {
      return Fonts.fieldIsRequired.tr;
    }
    return null;
  }

  String? validatesCPassWord(String? value, String? oldPass) {
    if (value!.isEmpty) {
      return Fonts.fieldIsRequired.tr;
    } else if (!(value == oldPass)) {
      return Fonts.passNotMatch.tr;
    }
    return null;
  }

  String? otpValidation(value) {
    RegExp regex = RegExp("^([0-9]{4}|[0-9]{6})");

    if (value!.isEmpty) {
      return "Enter Otp";
    }
    if (!regex.hasMatch(value)) {
      return "Enter Valid Otp";
    }
    return null;
  }

  String? checkEmpty(String? value) {
    if (value!.trim().isEmpty) {
      return Fonts.fieldIsRequired.tr;
    }
    return null;
  }
/*



  String? validatesWebsiteLink(String? value) {
    String pattern =
        r"[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return Fonts.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return Fonts.validateWebsiteMsg;
    }
    return null;
  }

  String? validatesPhone(String? value) {
    String pattern = r"^[0-9 ()]{4,16}$";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return Fonts.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return Fonts.validatePhoneMsg;
    }
    return null;
  }



 */
}
