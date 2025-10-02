import 'package:calorie_counter/languages/es.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'en.dart';
import 'fr.dart';
import 'pcm.dart';


class Language extends Translations {
  // TODO: implement keys
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'fr_FR': fr,
        'es_ES': es,
        'pcm_NG': pcm
      };
}
