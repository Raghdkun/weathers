import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/services/connection/checknetworkhandler.dart';
import 'package:weather_app/core/services/notificationservices.dart';
import 'package:weather_app/theme/changetheme.dart';
import 'core/app_export.dart';
import 'core/services/notificationbackground.dart';
import 'localization/changelocal.dart';
import 'theme/themedata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String foo = dotenv.get('API_KEY');
  print(foo);
  await initialServices();
  late SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  CheckNetworkHandler.networkListener();
  if (sharedPreferences.getString("city") != null) {
    NotificationServices.initializeNotifications();
    await BackGroundNotiService.initializeService(isStart: sharedPreferences.getBool("notifiaction_status"));
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    // Get.put(AppController());
    Changelocal changelocal = Get.put(Changelocal());
    Changetheme changetheme = Get.put(Changetheme());
    final Iterable<LocalizationsDelegate<dynamic>> delegates = {
      DefaultMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    };
    // print(" lang is ${Get.locale}");

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          onInit: () async {
            Platform.isAndroid
                ? await BackGroundNotiService.initAutoStart()
                : null;
          },
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: changetheme.appTheme ?? themeDatalight,
          darkTheme: changetheme.appTheme ?? themeDatadark,
          translations: AppLocalization(),
          fallbackLocale: Locale('en'),
          localizationsDelegates: delegates,
          locale: changelocal.language, //for setting localization strings
          title: 'Vortex weather',
          initialBinding: InitialBindings(),
          initialRoute: AppRoutes.splashscreen,
          getPages: AppRoutes.pages,
        );
      },
    );
  }
}
