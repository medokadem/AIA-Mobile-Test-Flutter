
import '../../catalog/enums/lang_type.dart';

class SharedData {
  static SharedData shared = SharedData();

  LangType langType = LangType.english;
  String? token;
  clearData() {

  }
}
