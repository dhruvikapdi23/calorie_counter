import 'dart:developer';

import '../../../../app_config.dart';


class LogoutDeleteAccountLayout extends StatelessWidget {
final String icon,title,description;
  const LogoutDeleteAccountLayout({super.key, required this.icon, required this.title, required this.description,});

  @override
  Widget build(BuildContext context) {
    log("ADDD");
    return Container(

      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      ),
      width: Get.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Image.asset(icon,height: 106,),
        VSpace(30),
        AppWidgets.getDialogView(title, description),
            VSpace(30),


          ]),
    );
  }
}
