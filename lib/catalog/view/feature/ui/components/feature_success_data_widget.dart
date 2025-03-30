import 'package:flutter/material.dart';

import '../../../../domain/models/feature_info.dart';
import 'feature_item.dart';

class FeatureSuccessDataWidget extends StatelessWidget {
  final List<FeatureInfo> list;
  const FeatureSuccessDataWidget({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        itemCount: 3,
        itemBuilder: (context, index) {
          return  FeatureItem(featureInfo: FeatureInfo());
        }
    );
  }
}
