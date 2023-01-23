/*class Schedule {
  final String id;
  final String customer;
  final String phone;
  final String date;
  final String time;
  final String status;
  final String obs;

  Schedule(
      this.id,
      this.customer,
      this.phone,
      this.date,
      this.time,
      this.status,
      this.obs,
      );

  Schedule.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        customer = json['customer'],
        phone = json['phone'],
        date = json['date'],
        time = json['time'],
        status = json['status'],
        obs = json['obs'];

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'customer': customer,
        'phone': phone,
        'date': date,
        'time': time,
        'status': status,
        'obs': obs
      };

  @override
  String toString() {
    return 'Schedule{customer: $customer, phone: $phone, date: $date, '
        'time: $time, status: $status, obs: $obs}';
  }
}*/

import 'dart:convert' as convert;

import 'package:intl/date_time_patterns.dart';
import 'package:login_ui/utils/event_bus.dart';
import 'package:login_ui/utils/sql/entity.dart';

class ScheduleEvents extends Event {
  String acao;
  String tipo;

  ScheduleEvents(this.acao, this.tipo);
  @override
  String toString() {
    return "ScheduleEvents {acao:$acao,tipo:$tipo}";
  }
}

class Schedule extends Entity {
  int? id;
  String? customer;
  String? phone;
  String? date;
  String? time;
  String? status;
  String? obs;
  String? createdAt;
  String? updatedAt;

  Schedule({
    this.id,
    this.customer,
    this.phone,
    this.date,
    this.time,
    this.status,
    this.obs,
    this.createdAt,
    this.updatedAt
  });

  Schedule.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    customer = map['customer'];
    phone = map['phone'];
    date = map['date'];
    time = map['time'];
    obs = map['obs'];
    status = map['status'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['phone'] = phone;
    data['date'] = date;
    data['time'] = time;
    data['obs'] = obs;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }

  String toString() {
    return 'Schedule {id: $id, customer: $customer, status: $status, created_at: $createdAt, updated_at: $updatedAt}';
  }
}