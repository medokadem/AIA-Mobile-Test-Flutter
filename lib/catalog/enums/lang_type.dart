import 'dart:ui';

enum LangType {
  arabic,english
}

extension LangTypeExtension on LangType {

  String get code {
    switch (this) {
      case LangType.arabic:
        return 'ar';
      case LangType.english:
        return 'en';
    }
  }

  String get name {
    switch (this) {
      case LangType.arabic:
        return 'العربية';
      case LangType.english:
        return 'English';
    }
  }

  String get font {
    switch (this) {
      case LangType.arabic:
        return 'Cairo';
      case LangType.english:
        return 'Poppins';
    }
  }

  Locale get local {
    switch (this) {
      case LangType.arabic:
        return const Locale('ar', 'SA');
      case LangType.english:
      return const Locale('en', 'US');
    }
  }

  String get icon {
    switch (this) {
      case LangType.arabic:
        return "";
      case LangType.english:
        return "";
    }
  }

}