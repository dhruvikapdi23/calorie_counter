import 'package:google_fonts/google_fonts.dart';

import '../app_config.dart';

class SuccessDialog extends StatelessWidget {
  final String? email;
  const SuccessDialog({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)), //this right here
      child: Container(
          decoration: AppDecoration.textBoxDecoration(
              color: AppColors.white,
              bColor: AppColors.white,
              radius: 25.0),
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.dimen20, vertical: AppDimens.dimen42),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             /* Image.asset(
                AppImages.sent,
                height: 108,
              ),
              const VSpace(42),*/

            ],
          )),
    );
  }
}
