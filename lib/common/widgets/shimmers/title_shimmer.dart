import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TitleShimmer extends StatelessWidget {
  const TitleShimmer({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true, child: Row(
        children: [
          Expanded(child: Container( height: 20,)),
        ],
      ),
    );
  }
}
