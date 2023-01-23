import 'package:login_ui/models/schedule.dart';
import 'package:login_ui/utils/sql/entity.dart';

class ScheduleApiResult extends Entity {

  //late final int page;
  //late final int totalResults;
  //late final int totalPages;

  late final String success;
  late final List<Schedule> data;
  late final String message;

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

  factory ScheduleApiResult.fromJson(Map<String, dynamic> json){
    List<Schedule> scheduleList = List<Schedule>.from(
        json['data'].map((i) => Schedule.fromJson(i))
    );

    return ScheduleApiResult(
      success: json['sucess'],
      data: scheduleList,
      message: json['message'],
    );
  }

  @override
  String toString() {
    return 'ScheduleApiResult{success: $success, '
        'data: $data, message: $message}';
  }
}