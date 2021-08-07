import 'package:flutter/material.dart';

import '../datamodels/base.dart';
import '../delegates/apex_delegate.dart';
import '../delegates/delegate.dart';
import '../delegates/fn_delegate.dart';
import '../delegates/rl_delegate.dart';
import '../enums/platform.dart';
import '../enums/stat_type.dart';
import '../error/failure.dart';
import '../services/stats_service.dart';

const _indexToType = <int, StatType>{
  0: StatType.fortnite,
  1: StatType.apex,
  2: StatType.rl,
};

class StatsProvider extends ChangeNotifier {
  final _service = StatsService.instance;

  BaseStats? _stats;
  BaseStats? get stats => _stats;

  Segment? _overallStats;
  Segment? get overallStats => _overallStats;

  StatType _type = StatType.fortnite;
  StatType get type => _type;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _noResults = false;
  bool get noResults => _noResults;

  String? _error;
  String? get error => _error;

  GameDelegate _delegate = FortniteDelegate();
  GameDelegate get delegate => _delegate;

  late PlatformType _platform;
  PlatformType get platform => _platform;

  StatsProvider() {
    _platform = _delegate.supportedPlatforms.first;
  }

  void _setLoading(bool newLoadingValue) {
    _isLoading = newLoadingValue;
    notifyListeners();
  }

  void changeStatType(int index) {
    // Non-null assertion since index should never be above 2
    _type = _indexToType[index]!;
    _stats = null;
    switch (_type) {
      case StatType.apex:
        _changeDelegate(ApexDelegate());
        break;
      case StatType.fortnite:
        _changeDelegate(FortniteDelegate());
        break;
      case StatType.rl:
        _changeDelegate(RocketLeagueDelegate());
        break;
    }
  }

  void _changeDelegate(GameDelegate newDelegate) {
    _delegate = newDelegate;
    _platform = _delegate.supportedPlatforms.first;
    notifyListeners();
  }

  void changePlatform(PlatformType newPlatform) {
    _platform = newPlatform;
    notifyListeners();
  }

  void fetchStats(String user) async {
    _setLoading(true);
    _noResults = false;
    _error = null;
    final url = delegate.generateUrl(platform, user);
    try {
      _stats = await _service.getStats(url);
      if (type == StatType.fortnite) {
        // Fortnite overall stats are at the last segment
        _overallStats = _stats!.segments.firstWhere((element) {
          final a = element.attributes;
          if (a.containsKey('input')) return false;
          if (a.containsKey('season')) return false;
          return a['playlistGroup'] == 'all';
        });
      } else {
        _overallStats = _stats!.segments.firstWhere((element) {
          return element.type == 'overview';
        });
      }
    } on Failure catch (e) {
      _error = e.message;
      if (_error == 'InvalidName' || _error!.startsWith("We could not find")) {
        _noResults = true;
        _error = null;
      }
    } on Exception catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }
}
