import '../../../models/feature_info.dart';

class GetFeatureResponse {
  List<FeatureInfo>? data;


  GetFeatureResponse({this.data});

  GetFeatureResponse.fromJson(Map<String, dynamic> json) {

    ///List of object
    if (json['data'] != null) {
      data = <FeatureInfo>[];
      json['data'].forEach((v) {
        data!.add(FeatureInfo.fromJson(v));
      });
    }
    ///one object
    // data2 = json['data2'] != null
    //     ? data2.fromJson(json['data2'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    ///List of object
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    ///one object
    // if (data2 != null) {
    //   data['data2'] = data2!.toJson();
    // }
    return data;
  }
}