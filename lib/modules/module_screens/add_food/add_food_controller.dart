import 'package:image_picker/image_picker.dart';

import '../../../app_config.dart';

class AddFoodController extends GetxController {
  TextEditingController foodName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController weightGoal = TextEditingController();
  String? gender;
  XFile? image;

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  selectGender(v) {
    gender = v;
    update();
  }

  deleteConfirmation() {
    AppDialogs.showCommonDialog(
      LogoutDeleteAccountLayout(
        icon: AppImages.delete,
        title: Fonts.deleteAccount.tr,
        description: Fonts.deleteConfirmation.tr,
      ),
      isDelete: true,
    );
  }
}
