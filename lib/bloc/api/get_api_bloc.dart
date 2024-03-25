

import 'package:blocs/res/get_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
     emit(state.copyWith(isLoading: true, message: null));
    try {
      final data = await getData.getData();
      emit(state.copyWith(isLoading: false, data: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, message: 'Failed to fetch data'));
    }
  }

}