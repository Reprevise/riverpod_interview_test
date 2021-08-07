import '../enums/platform.dart';
import 'delegate.dart';

class FortniteDelegate extends GameDelegate {
  @override
  String get baseUrl =>
      "https://fortnitetracker.com/api/v2/fortnite/standard/profile";

  @override
  List<PlatformType> get supportedPlatforms =>
      [PlatformType.epic, PlatformType.psn, PlatformType.xbl];
}
