import 'dart:async';
import 'dart:io';


import 'package:calorie_counter/utils/size_utils.dart';
import 'package:calorie_counter/utils/utils.dart';
import 'package:sizer/sizer.dart';

import 'app_config.dart';
import 'languages/language_translate.dart';
import 'modules/auth_screens/splash_screen/splash_screen.dart';
import 'routes/route_method.dart';
import 'utils/app_preferences.dart';



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppHelper.init();
    await AppPreference.initMySharedPreferences();

    // await Firebase.initializeApp();
    // await FireBaseNotification().setUpLocalNotification();
    // FirebaseAnalyticsUtils().init();
    // FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
    // await crashlytics.setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = crashlytics.recordFlutterError;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(const MyApp());
  }, (error, stack) {
    debugPrint("error :$error");
    // crashlytics.recordError(error, stack);
  });
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          SizeUtils().init(context);

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: Fonts.appName.tr,
            theme: AppTheme.light,
            getPages: AppRoute().getPages,
            translations: Language(),
            locale: const Locale('en', 'US'),
            initialBinding: AppBidding(),

            fallbackLocale: const Locale('en', 'US'),
            themeMode: ThemeMode.light,
            builder: (context, child) {
              return Scaffold(
                body: GestureDetector(
                  onTap: () {
                    Utils.hideKeyboardInApp(context);
                  },
                  child: child,
                ),
              );
            },
            home: const SplashScreen());
      }
    );
  }
}



class AppBidding extends Bindings {
  @override
  void dependencies() {}
}
