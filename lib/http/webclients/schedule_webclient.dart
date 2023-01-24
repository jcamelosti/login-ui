import 'dart:convert';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_ui/http/webclient.dart';
import 'package:login_ui/models/schedule.dart';
import 'package:login_ui/models/schedule_api_result.dart';
import 'package:login_ui/utils/http_helper.dart' as http;

class ScheduleWebClient {
  final endPoint = Uri.parse("$baseUrl/schedule/");

  final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
    409: 'transaction already exists',
    422: 'unprocessable Entity',
  };

  Future<ScheduleApiResult> getSchedules() async {
    var url =  Uri.parse("$baseUrl/schedule/");
    await Future.delayed(const Duration(seconds: 2));

    var response = await http.get(url);

    String json = utf8.decode(response.bodyBytes);
    print(json.toString());
    return ScheduleApiResult.fromJson(convert.json.decode(json));
  }

  Future<List<Schedule>> listar() async {
    List<Schedule>? schedules = <Schedule>[];
    var url =  Uri.parse("$baseUrl/schedule/");

    await Future.delayed(const Duration(seconds: 2));

   var response = await http.get(url);

    /*String json = jsonEncode(response.body);
    print(json.toString());

    ScheduleApiResult res = ScheduleApiResult.fromJson(jsonDecode(json));
    print(res.toString());*/

    //String json = utf8.decode(response.bodyBytes);
    //print(ScheduleApiResult.fromJson(convert.json.decode(json)));

    Map mapResponse = json.decode(response.body);
    final result = ScheduleApiResult.fromJson(mapResponse);

    schedules = result.data;

    print(schedules);

    return !schedules.isNotEmpty ? schedules : <Schedule>[];
  }

  Future<List<Schedule>> findAll() async {
    List<Schedule>? schedules = <Schedule>[];
    await Future.delayed(const Duration(seconds: 2));

    final Response response = await client.get(endPoint, headers: {
      'Content-type': 'application/json',
      'Authorization': "Bearer 58|WePJ1reXhlAMD2hXd374mPqVl7lP7GxcVItinulT",
    },);

    final parsedJson = jsonDecode(response.body);
    //print('${parsedJson.runtimeType} : $parsedJson');
    //final schedulesData = parsedJson['data'] as List<dynamic>?;

    /*// if the reviews are not missing
    final reviews = reviewsData != null
    // map each review to a Review object
        ? reviewsData.map((reviewData) => Schedule.fromJson(reviewData))
    // map() returns an Iterable so we convert it to a List
        .toList()
    // use an empty list as fallback value
        : <Schedule>[];*/

    //debugPrint(schedulesData.toString());

    //Iterable list = parsedJson['data'] as List<dynamic>?;
    //schedules = list.map((model) => Schedule.fromJson(model)).toList();

    //schedules = schedulesData?.map((e) => Schedule.fromJson(e)).toList();
    //debugPrint(schedules.toString());

    /*return <Schedule>[
      Schedule("1", "teste", "teste", "24/01/2022", "08:00:00", "agendado","teste"),
      Schedule("1", "teste", "teste", "24/01/2022", "08:00:00", "agendado","teste"),
      Schedule("1", "teste", "teste", "24/01/2022", "08:00:00", "agendado","teste"),
      Schedule("1", "teste", "teste", "24/01/2022", "08:00:00", "agendado","teste"),
      Schedule("1", "teste", "teste", "24/01/2022", "08:00:00", "agendado","teste"),
      Schedule("1", "teste", "teste", "24/01/2022", "08:00:00", "agendado","teste"),
      Schedule("1", "teste", "teste", "24/01/2022", "08:00:00", "agendado","teste"),
      Schedule("1", "teste", "teste", "24/01/2022", "08:00:00", "agendado","teste")
    ];*/
    //return !schedules.isNotEmpty ? schedules : <Schedule>[];
    return <Schedule>[];
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