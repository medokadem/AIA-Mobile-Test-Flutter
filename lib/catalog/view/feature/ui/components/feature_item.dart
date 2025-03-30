import 'package:flutter/material.dart';

import '../../../../../common/config/app_colors.dart';
import '../../../../domain/models/feature_info.dart';

class FeatureItem extends StatelessWidget {
  final FeatureInfo featureInfo;

  const FeatureItem({super.key, required this.featureInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
      child: Container(
        height: 200,
        decoration:  BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

}
