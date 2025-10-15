import 'package:intl/intl.dart';

class AppUtils {
//Write conditional param here
  final date = DateFormat("E, d MMMM").format(DateTime.now());

}

enum MessageType { text, image, chaptersVersion }