import 'package:flutter/material.dart';
import 'package:login_ui/components/progress.dart';
import 'package:login_ui/http/webclients/schedule_webclient.dart';
import 'package:login_ui/models/schedule.dart';
import 'package:login_ui/models/schedule_api_result.dart';

import '../components/centered_message.dart';

class SchedulesList extends StatelessWidget {
  SchedulesList({super.key});

  final ScheduleWebClient _webClient = ScheduleWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedules'),
      ),
      body: FutureBuilder<List<Schedule>>(
        future: _webClient.listar(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if(snapshot.hasData){
                final List<Schedule>? schedules = snapshot.data;
                print(schedules);
                if (schedules!.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Schedule schedule = schedules[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.monetization_on),
                          title: Text(
                            schedule.customer.toString(),
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            schedule.phone.toString(),
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: schedules.length,
                  );
                }
              }
              return CenteredMessage(
                'No Schedules found',
                icon: Icons.warning,
              );
              break;
          }

          return CenteredMessage('Unknown error');
        },
      ),
    );
  }
}