import 'dart:developer';

import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';

class GeneralInformationController extends GetxController {




  activeInactive(mainIndex,index,val){
    AppArray.accountSettingList[mainIndex].subMenuList![index].isActive =val;
    update();
  }


  minusTap(mainIndex){
    int value = AppArray.accountSettingList[mainIndex].value!;
    if(value > 0) {
      value--;
      AppArray.accountSettingList[mainIndex].value = value;
      update();
    }

  }

  plusTap(mainIndex){
    int value = AppArray.accountSettingList[mainIndex].value!;
    value++;
    AppArray.accountSettingList[mainIndex].value = value;
    update();

  }
}
