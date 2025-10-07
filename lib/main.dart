import 'dart:io';


import 'app_config.dart';
import 'languages/language_translate.dart';
import 'routes/route_method.dart';
import 'modules/auth_modules/splash_screen/splash_screen.dart';



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
  await AppHelper.init();
  HttpOverrides.global = MyHttpOverrides();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Fonts.appName,
        theme: AppTheme.light,
        getPages: AppRoute().getPages,
        translations: Language(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        themeMode: ThemeMode.light,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(FontDimen.textScaleFactor)),
            child: SafeArea(
              top: false,
              bottom: Platform.isIOS ? false : true,
              child: child!,
            ),
          );
        },
        home: const SplashScreen());
  }
}
