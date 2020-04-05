import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.1.226:54095/api/consumers';

  Future<http.Response> fetchExploreData() {
    final response = http.get(baseUrl);
    return response;
  }
}
