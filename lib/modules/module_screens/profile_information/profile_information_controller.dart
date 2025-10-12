
import '../../../app_config.dart';

class ProfileInformationController extends GetxController {
 TextEditingController email = TextEditingController();
 TextEditingController name = TextEditingController();
 TextEditingController dob = TextEditingController();
 TextEditingController height = TextEditingController();
 TextEditingController weight = TextEditingController();
 TextEditingController weightGoal = TextEditingController();
String? gender;


selectGender(v){
 gender =v;
 update();
}

 deleteConfirmation() {
  AppDialogs.showCommonDialog(LogoutDeleteAccountLayout(
   icon: AppImages.delete,
   title: Fonts.deleteAccount.tr,
   description: Fonts.deleteConfirmation.tr,
  ),isDelete: true);
 }
}
