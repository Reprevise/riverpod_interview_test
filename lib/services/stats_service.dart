import 'dart:convert';

import 'package:http/http.dart' as http;

import '../datamodels/base.dart';
import '../error/failure.dart';

class StatsService {
  StatsService._();

  static StatsService instance = StatsService._();

  Future<BaseStats> getStats(String url) async {
    final r = await http.get(Uri.parse(url));
    return _parseStats(r.body);
  }

  BaseStats _parseStats(String body) {
    final json = (jsonDecode(body) as Map).cast<String, dynamic>();

    if (json.containsKey('errors')) {
      final error = json['errors'][0];
      if (error == null) {
        throw Failure();
      }
      String message = error['message'];
      if (error['message'] == "") {
        message = error['code'].split("::")[1];
      }
      throw Failure(message);
    }

    return BaseStats.fromMap(json['data']);
  }
}
