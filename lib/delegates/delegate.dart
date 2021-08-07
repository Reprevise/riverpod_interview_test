import 'package:enum_to_string/enum_to_string.dart';

import '../enums/platform.dart';

abstract class GameDelegate {
  List<PlatformType> get supportedPlatforms;

  String get baseUrl;

  String generateUrl(PlatformType platform, String username) {
    final pString = EnumToString.convertToString(platform);
    return Uri.encodeFull("$baseUrl/$pString/$username");
  }
}
