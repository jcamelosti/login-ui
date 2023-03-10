import 'package:login_ui/models/schedule.dart';
import 'package:login_ui/utils/sql/entity.dart';

class ScheduleApiResult extends Entity {

  //late final int page;
  //late final int totalResults;
  //late final int totalPages;

  bool success;
  List<Schedule> data;
  String message;

  ScheduleApiResult({
    required this.success,
    required this.data,
    required this.message,
  });

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = data;
    data['message'] = message;

    return data;
  }

  /*ScheduleApiResult.fromJson(Map<dynamic, dynamic> json){
    List<Schedule> scheduleList = List<Schedule>.from(
        json['data'].map((i) => Schedule.fromJson(i))
    );
    success = json['success'];
    data = scheduleList;
    message = json['message'];
  }*/

  factory ScheduleApiResult.fromJson(dynamic json) {
    List<Schedule> schedulesList = List<Schedule>.from(
        json['data'].map((i) => Schedule.fromJson(i))
    );
    return ScheduleApiResult(
        success: json["success"],
        data: schedulesList,
        message: json["message"],
    );
  }

  @override
  String toString() {
    return 'ScheduleApiResult{success: $success, '
        'data: $data, message: $message}';
  }
}