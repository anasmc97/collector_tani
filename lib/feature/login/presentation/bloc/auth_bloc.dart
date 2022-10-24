import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_tani/feature/login/data/models/auth_model.dart';
import 'package:project_tani/feature/login/domain/entities/user.dart';

import 'package:project_tani/feature/login/domain/usecase/login_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/sign_up_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase? login;
  final SignUpUsecase? signUp;
  AuthBloc({required this.login, required this.signUp}) : super(AuthInitial()) {
    on<LoginEvent>(_mapLoginEvent);
    on<SignUpEvent>(_mapSignUpEvent);
    on<AutoLoginEvent>(_mapAutoLoginEvent);
    on<LogoutEvent>(_mapAutoLogoutEvent);
  }

  void _mapLoginEvent(
    LoginEvent event, Emitter<AuthState> emit) async{
      emit(AuthLoading());
      try {
        final AuthModel? data = await login!.call(ParamsLogin(email: event.email, password: event.password));
        if (data == null) {
          emit(AuthEmpty());
        } else {
          final sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('user', json.encode(data.toJson()));
          emit(AuthDataLoaded(user: data));
        }
      } catch (e) {
        emit(AuthDataError(message: e.toString()));
      }
    }

  void _mapSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    try {
      final User? data =
      await signUp!.call(ParamsSignUp(email: event.email, password: event.password, name: event.name, phoneNumber: event.phoneNumber));
      if (data == null) {
        emit(AuthEmpty());
      } else {
        emit(AuthDataLoaded(user: data));
      }
    } catch (e) {
      emit(AuthDataError(message: e.toString()));
    }
  }

  void _mapAutoLoginEvent(AutoLoginEvent, Emitter<AuthState> emit) async {
      User? user;
        final sharedPreferences = await SharedPreferences.getInstance();
        if(sharedPreferences.containsKey('user')){
          String? data = sharedPreferences.getString('user');
          final dataJson = json.decode(data!);
          if(dataJson['token'] != null || dataJson['token'] != 'null'){
            user = AuthModel.fromJson(dataJson);
            emit(AuthDataLoaded(user: user));
          }else{
            emit(AuthInitial());
          }
        }else{
          emit(AuthInitial());
        }

  }

  void _mapAutoLogoutEvent(LogoutEvent, Emitter<AuthState> emit) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("user");
    emit(AuthInitial());
  }
}
