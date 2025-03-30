
import '../../common/config/app_config.dart';

enum PlatformType {
  android,ios,huawei
}

extension PlatformTypeExtension on PlatformType {

  String get code {
    switch (this) {
      case PlatformType.android:
        return 'ANDROID';
      case PlatformType.ios:
        return 'IOS';
      case PlatformType.huawei:
        return 'HUAWEI';
    }
  }

 String get storeLink {
    switch (this) {
      case PlatformType.android:
        return AppStores.googlePlayUrl;
      case PlatformType.ios:
        return AppStores.appStoreUrl;
      case PlatformType.huawei:
        return AppStores.huaweiStoreURL;
    }
  }

  static PlatformType fromValue(String type){
    if(type == PlatformType.huawei.code){
      return PlatformType.huawei;
    }
    if(type == PlatformType.android.code){
      return PlatformType.android;
    }
    else{
      return PlatformType.ios;
    }
  }
}