import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_tour_mobile/helpers/JsonHelper.dart';
import 'package:smart_tour_mobile/models/BaseTourModel.dart';

class ApiService {
  static final String baseUrl = 'http://192.168.1.226/api';
  static final int agencyId = 5;
  static final String queryAgency = "?agencyId=" + agencyId.toString();

  static Future<http.Response> fetchUserData() {
    final response = http.get(baseUrl + '/user');
    return response;
  }

  static Future<List<BaseTourModel>> fetchBaseTours() async {
    final response =
        await http.get(baseUrl + '/baseTours/public' + queryAgency);
    print(baseUrl + '/baseTours/public' + queryAgency);
    if (response.statusCode == 200) {
      print(response.body);
      return JsonHelper.listBaseTourFromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<List<BaseTourModel>> fetchLiveTours() async {
    final response =
        await http.get(baseUrl + '/liveTours/public' + queryAgency);
    print(baseUrl + '/liveTours/public' + queryAgency);
    if (response.statusCode == 200) {
      print(response.body);
      return JsonHelper.listBaseTourFromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
