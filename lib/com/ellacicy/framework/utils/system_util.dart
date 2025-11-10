import 'dart:io';
import 'package:flutter_app_info/device_info_plus.dart';

class SystemUtil {
  static Future<String> getHardWare() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
      return "${androidInfo.brand},${androidInfo.model}";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    }
    return "other";
  }

  static String getOperatingSystem() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "iOS";
    } else if (Platform.isLinux) {
      return "Linux";
    } else if (Platform.isMacOS) {
      return "macOS";
    } else if (Platform.isWindows) {
      return "Windows";
    } else if (Platform.isFuchsia) {
      return "Fuchsia";
    } else {
      return "Unknown";
    }
  }
}
