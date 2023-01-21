import 'dart:convert';
import 'package:http/http.dart';
import 'package:login_ui/http/webclient.dart';
import 'package:login_ui/models/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleWebClient {
  final endPoint = Uri.parse("$baseUrl/schedule/");

  final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
    409: 'transaction already exists',
    422: 'unprocessable Entity',
  };

  Future<List<Schedule>> findAll() async {
    final Response response = await client.get(endPoint, headers: {
      'Content-type': 'application/json',
      'Authorization': "Bearer 58|WePJ1reXhlAMD2hXd374mPqVl7lP7GxcVItinulT",
    },);
    /*final List<dynamic> decodedJson = jsonDecode(response.body);
    debugPrint(decodedJson.toString());
    return decodedJson
        .map((dynamic json) => Schedule.fromJson(json))
        .toList();*/
    /*final Map<String, dynamic> parsed = json.decode(response.body);
    var data = json.decode(parsed['data']);

    debugPrint(data);*/
    return [];
  }

  Future<Schedule> save(Schedule schedule, String password) async {
    final String scheduleJson = jsonEncode(schedule.toJson());

    await Future.delayed(const Duration(seconds: 2));

    final Response response = await client.post(endPoint ,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: scheduleJson);

    if (response.statusCode == 200) {
      return Schedule.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String? _getMessage(int statusCode) {
    if(_statusCodeResponses.containsKey(statusCode)){
      return _statusCodeResponses[statusCode];
    }
    return 'unknown error';
  }
}