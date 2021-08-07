import '../enums/platform.dart';
import 'delegate.dart';

class ApexDelegate extends GameDelegate {
  @override
  List<PlatformType> get supportedPlatforms =>
      [PlatformType.origin, PlatformType.xbl, PlatformType.psn];

  @override
  String get baseUrl => "https://api.tracker.gg/api/v2/apex/standard/profile";
}
