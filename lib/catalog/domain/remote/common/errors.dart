import 'invalid_field.dart';

class Errors {
  List<InvalidField?>? invalidFields;
  String? global;

  Errors({this.invalidFields,this.global});

  Errors.fromJson(dynamic json) {
    global = json['global'];

    if (json != null) {
      if (json["invalid_fields"] != null) {
        invalidFields = [];
        json["invalid_fields"].forEach((v) {
          invalidFields?.add(InvalidField.fromJson(v));
        });
      }
    }

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (invalidFields != null) {
      map["invalid_fields"] = invalidFields?.map((v) => v?.toJson()).toList();
    }

    map['global'] = global;
    return map;
  }
}