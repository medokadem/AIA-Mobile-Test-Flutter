
import 'package:aia_mobile_test_flutter/catalog/view/feature/ui/feature_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainTabBarScreen extends StatefulWidget {
  static const routeName = 'MainTabBarScreen';

  const MainTabBarScreen({super.key});

  @override
  State createState() => _MainTabBarScreenState();
}

class _MainTabBarScreenState extends State<MainTabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FeatureScreen(),
    );
  }
}