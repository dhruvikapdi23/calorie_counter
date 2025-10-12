import 'dart:developer';

import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import '../../../models/language_model.dart';

class LanguageController extends GetxController {
  LanguageModel? selectedLanguage;
GetStorage storage = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit

    String? code = storage.read(Session.languageCode);
    selectedLanguage = AppArray.languageList.where((element) => element.code == (code??"en")).first;
    update();
    super.onInit();
  }

  //on language select
  onLanguageSelectTap(lan) async {
    selectedLanguage = lan;
    final storage = GetStorage();
    log("selectedLanguage :$selectedLanguage");
    Locale? locale = selectedLanguage!.locale;

    String lanCode = selectedLanguage!.code!;
    log("Lan :$locale");
    storage.write(Session.languageCode, lanCode);
    storage.write(Session.language, selectedLanguage!.title!);
    update();

    log("locale:$lanCode");
    Get.updateLocale(locale!);
    Get.forceAppUpdate();
  }


}
