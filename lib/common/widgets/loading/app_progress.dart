import 'dart:io';

import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class AppProgress extends StatelessWidget {

  final Color color;

  const AppProgress({super.key, this.color = AppColors.primaryColor});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: Platform.isIOS ? color : null,
      ),
    );
  }
}
