import 'package:calorie_counter/extension/widget_extension.dart';

import '../app_config.dart';

PopupMenuItem buildPopupMenuItem({list}) {
  return PopupMenuItem(
      padding: EdgeInsets.zero,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),

          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: .15),
                  blurRadius: 40,
                  spreadRadius: 10,
                  offset: const Offset(0, 30),
                )
              ]),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: list!)));
}

class ChatPopupItemRowCommon extends StatelessWidget {
  final dynamic data;
  final int? index;
  final List? list;
  final GestureTapCallback? onTap;
  final bool isTitle;
  final String? selectedVoice;

  const ChatPopupItemRowCommon(
      {super.key,
      this.index,
      this.data,
      this.list,
      this.onTap,
      this.isTitle = true,
      this.selectedVoice});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(data.toString().tr,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style:
                      Get.theme.textTheme.headlineSmall!.copyWith(fontSize: 15))
              .alignment(Alignment.centerLeft)
              .paddingSymmetric(horizontal: AppDimens.dimen10),

        ]).inkWell(onTap: onTap);
  }
}

PopupMenuItem buildPopupMenuItems(context, list,
    {position, bool icon = false, data, index}) {
  return PopupMenuItem(
    value: position,
    onTap: () {},
    padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen10, vertical: AppDimens.dimen15),
    height: 20,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ]),
  );
}
