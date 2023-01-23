import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response> get(Uri url) async {
  final headers = await _headers();
  var response = await http.get(url, headers: headers);
  return response;
}

Future<http.Response> post(Uri url, {body}) async {
  final headers = await _headers();
  var response = await http.post(url, body: body, headers: headers);
  return response;
}

Future<http.Response> put(Uri url, {body}) async {
  final headers = await _headers();
  var response = await http.put(url, body: body, headers: headers);
  return response;
}

Future<http.Response> delete(Uri url) async {
  final headers = await _headers();
  var response = await http.delete(url, headers: headers);
  return response;
}

Future<Map<String, String>> _headers() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final apiData = sharedPreferences.getString('authtoken');

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiData"
  };
  return headers;
}
