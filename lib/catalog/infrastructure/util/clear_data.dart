import '../../../common/config/shared_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClearData {

  static clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    SharedData.shared.clearData();
    await preferences.clear();
  }

}