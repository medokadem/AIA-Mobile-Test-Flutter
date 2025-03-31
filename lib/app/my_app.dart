import 'package:flutter/material.dart';
import '../catalog/enums/lang_type.dart';
import '../catalog/service/navigation/navigation_service.dart';
import '../common/config/app_colors.dart';
import '../common/config/shared_data.dart';
import '../out-buildings/dependency_injector.dart';
import 'app_routes.dart';
import 'my_app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      onGenerateInitialRoutes: (_) => [
        RouteGenerator.onGenerateRoute(RouteSettings(name: _)),
      ],
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      onUnknownRoute: RouteGenerator.onUnknownRoute,
      navigatorObservers: [getIt<NavigationService>().routeObserver],
      navigatorKey: getIt<NavigationService>().navigationKey,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
              useMaterial3: false,
              canvasColor: Colors.white,
              primaryColor: AppColors.primaryColor,
              splashColor: Colors.transparent,
              progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.secondaryColor),
              scrollbarTheme:
              const ScrollbarThemeData().copyWith(thumbColor: WidgetStateProperty.all(Colors.transparent)),
              highlightColor: Colors.transparent,
              colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.primaryColor),
              fontFamily: SharedData.shared.langType.font,
              appBarTheme: AppBarTheme(
                  elevation: 0.4,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                      fontFamily: SharedData.shared.langType.font),
                  iconTheme: const IconThemeData(
                    color: AppColors.primaryColor,
                  ))),
          child: child!,
        );
      });
  }
}
