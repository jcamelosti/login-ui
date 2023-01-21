import 'package:flutter/material.dart';
import 'package:login_ui/components/theme.dart';
import 'package:login_ui/screens/login_demo.dart';
import 'package:login_ui/screens/schedules_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appCustomTheme,
      home: SchedulesList(),
    );
  }
}