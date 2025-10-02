import 'dart:developer';
import 'dart:io';

import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/utils/app_session_key.dart';
import 'package:intl/intl.dart';

class AppFunctions {
  // static String timestampToDateTime(String timestamp) {
  //   var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  //   final f = DateFormat('dd MMM yyyy hh:mm a');
  //   return f.format(date).toString();
  // }


  static String getLanguageName() {
    String langCode = StorageHelper().storage.read(Session.languageCode);
    String title = AppArray()
        .languageList
        .where((element) => element['code'] == langCode)
        .first['title'];
    return title;
  }

  static String getBibleVersionCode() {
    dynamic version = StorageHelper().storage.read(Session.bibleVersion);
    String title = version['short_title'];
    return title;
  }

  getSelectedLanguage() {
    String langCode = StorageHelper().storage.read(Session.languageCode);

    dynamic lang = AppArray()
        .languageList
        .where((element) => element['code'] == langCode)
        .first;
    log("lang:$lang");

    return lang;
  }


  getLoggedUserId() {
    dynamic user = StorageHelper().storage.read(Session.user);
    return user != null ? user['user_id'] : null;
  }

  getLoggedUser() {
    dynamic user = StorageHelper().storage.read(Session.user);
    return user;
  }

  getLoggedUserImage() {
    dynamic user = StorageHelper().storage.read(Session.user);
    return user != null ? user['profile_image'] : null;
  }

  getImage(data) {
    return data['senderId'].toString() ==
            AppFunctions().getLoggedUserId().toString()
        ? data['receiverImage'] != ""
            ? data['receiverImage']
            : null
        : data['senderImage'] != ""
            ? data['senderImage']
            : null;
  }


  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }

  // Method to format the seconds into minutes and seconds
  static String getFormattedTime(seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  getDate(date) {
    DateTime now = DateTime.now();
    String when;
    DateTime dateTime = DateTime.parse(date);
    if (dateTime.day == now.day) {
      when = 'Today';
    } else if (dateTime.day == now.subtract(const Duration(days: 1)).day) {
      when = 'Yesterday';
    } else {
      when = "${DateFormat.MMMd().format(dateTime)}-other";
    }
    return when;
  }



  removeSession() {
    StorageHelper().storage.remove(Session.user);
    StorageHelper().storage.remove(Session.bibleVersion);
    StorageHelper().storage.remove(Session.oldBookList);
    StorageHelper().storage.remove(Session.newBookList);
    StorageHelper().storage.remove(Session.oldTestament);
    StorageHelper().storage.remove(Session.newTestament);
    StorageHelper().storage.remove(Session.bookmarkList);
    StorageHelper().storage.remove(Session.highListColorCountList);
    StorageHelper().storage.remove(Session.highlightList);
    StorageHelper().storage.remove(Session.localSaveVerse);
    StorageHelper().storage.remove(Session.bibleVersionList);
    StorageHelper().storage.remove(Session.highListColorCountList);
    StorageHelper().storage.remove(Session.isBgPlay);

    Get.forceAppUpdate();
    log("storage.remove(Session.user) : :${StorageHelper().storage.read(Session.user)}");
  }


}
