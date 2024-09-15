import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'core/core_folder/app/app.locator.dart';
import 'core/core_folder/app/app.router.dart';
import 'core/core_folder/manager/shared_preference.dart';
import 'firebase_options.dart';

final navigate = locator<NavigationService>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (Platform.isIOS) {
  //   await Firebase.initializeApp();
  // }
  setupLocator();
  await locator<SharedPreferencesService>().initilize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(373, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        initialRoute: SharedPreferencesService.instance.isLoggedIn == true
            ? Routes.dashboard
            : Routes.firstScreen,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}
