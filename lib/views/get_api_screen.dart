

import 'package:blocs/bloc/api/get_api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetAPiBloc, GetApiState>(
        builder: (context, state) {
        if (state.isLoading) {
          return CircularProgressIndicator();
        } else if (state.message != null) {
          return Text(state.message!);
        } else {
          Map<String, dynamic>? data = state.data as Map<String, dynamic>?;
          if (data != null) {
            // Display your data here
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Attendance Listing:'),
                  for (var entry in data.entries)
                    Text('${entry.key} : ${entry.value}'),
                  Text('Present: ${state.present}'),
                  Text('Absent: ${state.absent}'),
                  Text('Working: ${state.working}'),
                  Text('New Working Day: ${state.newworkingday}'),
                  Text('Capture Status: ${state.statusfunctiontype}'),
                  Text('Login Status: ${state.login_status}'),
                  Text('Version Code: ${state.version_code}'),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        }
      },),
    );
  }
}