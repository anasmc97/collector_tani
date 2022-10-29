import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_tani/feature/login/data/models/auth_model.dart';

import 'package:project_tani/feature/login/domain/usecase/login_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/logout_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/sign_up_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase? login;
  final SignUpUsecase? signUp;
  final LogoutUsecase? logout;
  AuthBloc({required this.login, required this.signUp, required this.logout}) : super(AuthInitial()) {
    on<LoginEvent>(_mapLoginEvent);
    on<SignUpEvent>(_mapSignUpEvent);
    on<AutoLoginEvent>(_mapAutoLoginEvent);
    on<LogoutEvent>(_mapLogoutEvent);
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
          emit(AuthDataLoaded(authModel: data));
        }
      } catch (e) {
        emit(AuthDataError(message: e.toString()));
      }
    }

  void _mapSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    try {
      final AuthModel? data =
      await signUp!.call(ParamsSignUp(email: event.email, password: event.password, name: event.name, phoneNumber: event.phoneNumber));
      if (data == null) {
        emit(AuthEmpty());
      } else {
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('user', json.encode(data.toJson()));
        emit(AuthDataLoaded(authModel: data));
      }
    } catch (e) {
      emit(AuthDataError(message: e.toString()));
    }
  }

  void _mapAutoLoginEvent(AutoLoginEvent event, Emitter<AuthState> emit) async {
    AuthModel? authModel;
        final sharedPreferences = await SharedPreferences.getInstance();
      if(sharedPreferences.containsKey('user')){
        String? data = sharedPreferences.getString('user');
        if(data != null){
          final dataJson = json.decode(data);
          authModel = AuthModel.fromJson(dataJson);
          emit(AuthDataLoaded(authModel: authModel));
        }else{
          emit(AuthInitial());
        }
      }else{
        emit(AuthInitial());
      }

  }

  void _mapLogoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    await logout!.call(ParamsLogout(token: event.token));
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('user');
    emit(AuthInitial());
  }
}
