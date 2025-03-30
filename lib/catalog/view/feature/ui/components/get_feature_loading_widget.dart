import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/config/app_colors.dart';

class FeatureLoadingWidget extends StatelessWidget {
  const FeatureLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return  Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.only(bottom: 10,left: 24,right: 24),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child:
                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration( shape: BoxShape.circle,),
                          child: Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
                              child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100),),
                                width:50, height: 50,))
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
                                child: Container(margin: const EdgeInsets.symmetric(vertical:5,horizontal:10),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13),),
                                  width:150,height: 20,)),
                            Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
                                child: Container( margin: const EdgeInsets.symmetric(vertical:5,horizontal:10),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13),),
                                  height: 16,)),
                            Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
                                child: Container( margin: const EdgeInsets.symmetric(vertical:5,horizontal:10),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13),),
                                  width:100,height: 14,)),
                          ],
                        ),
                      ),
                    ],
                  )
              );
            }
            ),
        ],
      ),
    );
  }
}
