import 'dart:ui';

import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/widgets/success_dialog.dart';


class AppDialogs {
  static successSnackBar(String msg, {Function? onThenCall}) {
    if (msg.isNotEmpty) {
      return ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(
              duration: const Duration(seconds: 1),
              backgroundColor: AppColors.green,
              content: Text(msg,
                  style: TextStyle(
                      fontSize: FontDimen.dimen14,
                      color: AppColors.white))))
          .closed
          .then((value) => onThenCall!());
    }
  }

  static errorSnackBar(String msg) {
    if (msg.isNotEmpty) {
      return ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.red,
            content: Text(
              msg,
              style: TextStyle(
                  fontSize: FontDimen.dimen14, color: AppColors.white),
            )),
      );
    }
  }

  static showProcess() {
    return Get.dialog(
      barrierDismissible: false,
      AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: PopScope(canPop: false, child: AppWidgets.getLoadingView())),
    );
  }

  static showCommonDialog(Widget child,
      {bool isbottom = false, Function()? onTap}) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)), //this right here
            child: Container(
                decoration: AppDecoration.cardDecoration(),
                padding: EdgeInsets.all(AppDimens.dimen20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    if (!isbottom)
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              color: Get.theme.dividerColor,
                            )),
                      ),
                    child,
                    if (isbottom)
                      Row(
                        children: [
                          Expanded(
                              child: appButton(
                            Fonts.no.tr,
                            height: AppDimens.dimen50,
                            color: AppColors.lightGrey,
                            textColor: AppColors.primaryColor,
                            onTap: () => Get.back(),
                          ).paddingSymmetric(horizontal: AppDimens.dimenW40)),
                          Expanded(
                              child: appButton(
                            Fonts.yes.tr,
                            height: AppDimens.dimen50,
                            onTap: () {
                              Get.back();
                              onTap?.call();
                            },
                          ).paddingSymmetric(horizontal: AppDimens.dimenW40)),
                        ],
                      )
                  ],
                )),
          ),
        );
      },
    );
  }

  static showSuccessBottomSheet(Function() onTap, Widget? child) =>
      showModalBottomSheet<void>(
        context: Get.context!,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            side: BorderSide.none),
        elevation: 0,
        backgroundColor: Get.theme.cardColor,
        barrierColor: const Color(0xFF8E8E8E).withValues(alpha: .30),
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (child != null) child,
              ],
            ),
          );
        },
      );

/*

  static emailSendDialog(
      {TextEditingController? controller, GestureTapCallback? onTap}) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return EmailSendDialogLayout(onTap: onTap, controller: controller);
      },
    );
  }
*/

  static successDialog(email) {
    showDialog(
      barrierColor: Colors.black.withValues(alpha: .40),
      context: Get.context!,
      builder: (BuildContext context) {
        return SuccessDialog(email: email);
      },
    );
  }



  static pleaseWait() {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)), //this right here
            child: Container(
                decoration: AppDecoration.cardDecoration(),
                padding: EdgeInsets.all(AppDimens.dimen20),
                child: ListView(
                  shrinkWrap: true,
                  children: [

                    AppWidgets.loadingPleaseWait()
                  ],
                )),
          ),
        );
      },
    );
  }

}
