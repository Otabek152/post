import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:post_project/domen/api/api_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final dio = Dio();
    on<AuthRegister>((event, emit) async {
    final apiService = ApiService(dio);
      final postRegister = await apiService.postRegister({
        "firstname": event.firstName,
        "lastname": event.lastName,
        "phone": event.phoneNumber,
        "password": event.password,
      });
      print(postRegister);
    });
    on<AuthAds>((event, emit) async {
    final apiService = ApiService(dio);
            final postAds = await apiService.postAds({
              "title": event.title,
              "description": event.description,
              "lot": event.lot,
              "lat": event.lat
            });
      print(postAds);
    });
  }
}
