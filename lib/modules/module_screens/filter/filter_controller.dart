import '../../../app_config.dart';


class FilterController extends GetxController {
  TextEditingController search = TextEditingController();
  String displayOfResultByOrder = Fonts.alphabetical;


  @override
  void onInit() {
    // TODO: implement onInit

    update();
    super.onInit();
  }


  selectOrderTap(val){
    displayOfResultByOrder =val;
    update();
  }
}
