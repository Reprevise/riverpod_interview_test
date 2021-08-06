import 'package:riverpod_interview_test/delegates/delegate.dart';
import 'package:riverpod_interview_test/enums/platform.dart';

class RocketLeagueDelegate extends GameDelegate {
  @override
  String get baseUrl =>
      "https://api.tracker.gg/api/v2/rocket-league/standard/profile";

  @override
  List<PlatformType> get supportedPlatforms => [
        PlatformType.epic,
        PlatformType.psn,
        PlatformType.xbl,
        PlatformType.steam
      ];
}
