
class SetLocaleResponse {
  SetLocaleInfo? setLocale;

  SetLocaleResponse({required this.setLocale});

  SetLocaleResponse.fromJson(Map<String, dynamic> json) {

    if (json['notification'] != null) {
      setLocale = SetLocaleInfo.fromJson(json['notification']);

    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (setLocale != null) {
      data['notification'] = setLocale!.toJson();
    }

    return data;
  }
}

class SetLocaleInfo {
  String? body;
  String? createdAt;
  String? endDatetime;
  String? id;
  String? image;
  String? title;

  SetLocaleInfo({
    this.body,
    this.createdAt,
    this.endDatetime,
    this.id,
    this.image,
    this.title,
  });

  SetLocaleInfo.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    createdAt = json['created_at'];
    endDatetime = json['end_datetime'];
    id = json['id'];
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (body != null) {
      data['body'] = body;
    }
    data['created_at'] = createdAt;
    data['end_datetime'] = endDatetime;
    if (id != null) {
      data['id'] = id;
    }
    data['image'] = image;
    data['title'] = title;

    return data;
  }
}
