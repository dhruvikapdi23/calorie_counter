import 'package:calorie_counter/app_config.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AppHelper {

  static init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

   await GetStorage.init();

    debugPrint("CHECK1");
    await ScreenUtil.ensureScreenSize();

    WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.remove();





  }
}
