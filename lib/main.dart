import 'package:ast_official/app_ui_helpers/app_routes/app_routes.dart';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/services/notification_service/app_notification_service.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/main_provider/main_provider.dart';
import 'package:ast_official/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppNotificationService notificationService = AppNotificationService();

  //Uncomment it when you create providers
  runApp(MultiProvider(
    providers: providersList,
    child: const MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColor.black,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'AST®️ Official App',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        // home: const PaymentsRoyaltiesView(),
        initialRoute: RoutePaths.splashScreen,
        onGenerateRoute: AppRouter.generateRoute,
      );
    });
  }
}
