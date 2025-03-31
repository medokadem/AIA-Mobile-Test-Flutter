import 'package:aia_mobile_test_flutter/catalog/view/about/about_me_screen.dart';
import 'package:aia_mobile_test_flutter/catalog/view/feature/ui/feature_screen.dart';
import 'package:aia_mobile_test_flutter/catalog/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../catalog/view/chat/view/chat_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Widget getScreenByName({required RouteSettings settings}) {
    switch (settings.name) {
      case AppRoutes.featureScreen:
        return const FeatureScreen();
      case AppRoutes.splashScreen:
        return const SplashScreen();
      case AppRoutes.aboutScreen:
        return const AboutScreen();
      case AppRoutes.chatScreen:
        return const ChatScreen();
      default:
        return const Scaffold(
          body: SafeArea(
            child: Text(
              'Route Error',
            ),
          ),
        );
    }
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return getScreenByName(settings: settings);
        },
        settings: settings
    );
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (
        buildContext,
      ) =>
          const Scaffold(
        body: SafeArea(
          child: Text(
            'Route Error',
          ),
        ),
      ),
      settings: null,
    );
  }
}
