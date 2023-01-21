class Schedule {
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
}