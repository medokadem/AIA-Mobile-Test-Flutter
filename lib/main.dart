import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/my_app.dart';
import 'catalog/enums/lang_type.dart';
import '../../out-buildings/dependency_injector.dart' as di;
import 'common/config/app_config.dart';
import 'common/config/shared_data.dart';
import 'common/helper/shared_preferences_helper.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeApp();
  runApp(const MyApp());
}

// 045
Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await EasyLocalization.ensureInitialized();

  if (PrefsKeys.init == false) {
    await di.init();
    PrefsKeys.init = true;
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  ///App lang
  var langCode = await SharedPref().readString(key: PrefsKeys.languageCode, defaultValue: "ar");
  if (langCode == null) {
    SharedData.shared.langType = LangType.arabic;
  } else {
    if (langCode == LangType.arabic.code) {
      SharedData.shared.langType = LangType.arabic;
    } else {
      SharedData.shared.langType = LangType.english;
    }
  }

}
