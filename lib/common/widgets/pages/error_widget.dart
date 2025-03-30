import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_constants/app_images.dart';
import '../buttons/primery_button.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetryPressed;
  final bool showAnim;
  const ErrorPage({Key? key, required this.errorMessage, required this.onRetryPressed,this.showAnim = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showAnim ?
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Image.asset(AppImages.noDataImage),
            ),
          ): const SizedBox(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              errorMessage ,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.black.withAlpha(180),
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: PrimaryButton(
              title: 'retry'.tr(),
              onClick: onRetryPressed,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}