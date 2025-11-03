import 'package:calorie_counter/app_config.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';



class AppHelper {

  static init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

   await GetStorage.init();

    debugPrint("CHECK1");

    WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.remove();




  }
}
