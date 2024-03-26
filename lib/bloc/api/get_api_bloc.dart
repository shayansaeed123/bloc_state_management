

import 'dart:convert';

import 'package:blocs/res/get_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

///Event

abstract class GetApiEvent extends Equatable{
  const  GetApiEvent();

  List<Object?> get props  => [];
}

class  FetchDataFromServer extends GetApiEvent {}

///State

class GetApiState extends Equatable {
  final bool isLoading;
  final String? message;
  final Object? data;
  final String present;
  final String absent;
  final String working;
  final String newworkingday;
  final String statusfunctiontype;
  final String login_status;
  final String version_code;

  const GetApiState({
    this.isLoading = false,
    this.message,
    this.data,
    this.present = '',
    this.absent = '',
    this.working = '',
    this.newworkingday = '',
    this.statusfunctiontype = '',
    this.login_status = '',
    this.version_code = '',
  });

  GetApiState copyWith({
    bool? isLoading,
    String? message,
    Object? data,
    String? present,
    String? absent,
    String? working,
    String? newworkingday,
    String? statusfunctiontype,
    String? login_status,
    String? version_code,
  }) {
    return GetApiState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      data: data ?? this.data,
      present: present ?? this.present,
      absent: absent ?? this.absent,
      working: working ?? this.working,
      newworkingday: newworkingday ?? this.newworkingday,
      statusfunctiontype: statusfunctiontype ?? this.statusfunctiontype,
      login_status: login_status ?? this.login_status,
      version_code: version_code ?? this.version_code,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        message,
        data,
        present,
        absent,
        working,
        newworkingday,
        statusfunctiontype,
        login_status,
        version_code,
      ];
}

///Bloc
class GetAPiBloc extends Bloc<GetApiEvent , GetApiState> {

  GetApiRepository getData = GetApiRepository();
  GetAPiBloc() : super(const GetApiState()) {
    on<FetchDataFromServer>(_onFetchData);
  }

  void _onFetchData(FetchDataFromServer event , Emitter <GetApiState> emit)async{
     try {
    var user_id = '195';
    var login_code = '1';
    var params = {'user_id': user_id, 'login_code': login_code};

    ///Api
    String apiUrl = 'https://digitance.turk.pk/super_api/get_attenance_hr.php';
    final response = await http.post(Uri.parse(apiUrl), body: params);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      print('Response data: $data');

      emit(state.copyWith(
        isLoading: false,
        data: data,
        present: data['Present'].toString(),
        absent: data['Absent'].toString(),
        working: data['Working '].toString(),
        newworkingday: data['Working '].toString(),
        statusfunctiontype: data['capture_image'].toString(),
        login_status: data['login_status'].toString(),
        version_code: data['version_code'].toString(),
      ));
      print(data);
    } else {
      emit(state.copyWith(
        isLoading: false,
        message: 'Failed to fetch data. Status code: ${response.statusCode}',
      ));
    }
  } catch (e) {
    print('Failed to fetch data: $e');
    emit(state.copyWith(
      isLoading: false,
      message: 'Failed to fetch data: $e',
    ));
  }
  }

}