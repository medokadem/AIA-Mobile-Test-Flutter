class FeatureInfo {
  int? id;

  FeatureInfo({
    this.id,
  });

  FeatureInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    return data;
  }
}
