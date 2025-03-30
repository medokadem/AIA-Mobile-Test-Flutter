
class GetFeatureRequest {
  String? id;

  GetFeatureRequest({this.id});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['id'] = id;

    return data;
  }
}
