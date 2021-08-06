import 'package:flutter/material.dart';
import 'package:riverpod_interview_test/datamodels/base.dart';
import 'package:riverpod_interview_test/delegates/apex_delegate.dart';
import 'package:riverpod_interview_test/delegates/delegate.dart';
import 'package:riverpod_interview_test/delegates/fn_delegate.dart';
import 'package:riverpod_interview_test/delegates/rl_delegate.dart';
import 'package:riverpod_interview_test/enums/platform.dart';
import 'package:riverpod_interview_test/enums/stat_type.dart';
import 'package:riverpod_interview_test/error/failure.dart';
import 'package:riverpod_interview_test/services/stats_service.dart';

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
        changeDelegate(ApexDelegate());
        break;
      case StatType.fortnite:
        changeDelegate(FortniteDelegate());
        break;
      case StatType.rl:
        changeDelegate(RocketLeagueDelegate());
        break;
    }
  }

  void changeDelegate(GameDelegate newDelegate) {
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
      if (type == StatType.fortnite && _stats != null) {
        _overallStats = _stats!.segments.last;
      } else {
        _overallStats = _stats!.segments.first;
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
