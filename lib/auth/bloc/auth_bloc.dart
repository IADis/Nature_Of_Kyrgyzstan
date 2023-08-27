import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/auth/repository/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(InitialAuthState()) {
    on<SignUp>(
      (event, emit) async {
        try {
          emit(LoadingAuthState());
          await Future.delayed(const Duration(seconds: 1));
          await _authRepo.sigUp(email: event.email, password: event.password);
          emit(SuccessAuthState(''));
        } on FirebaseException catch (e) {
          emit(ErrorAuthState(error: e.message.toString()));
        }
      },
    );
    on<SignIn>(
      (event, emit) async {
        try {
          emit(LoadingAuthState());
          await Future.delayed(const Duration(seconds: 1));
          await _authRepo.signIn(email: event.email, password: event.password);
          emit(SuccessAuthState(''));
        } on FirebaseException catch (e) {
          emit(ErrorAuthState(error: e.message.toString()));
        }
      },
    );
    on<ResetPassword>(
      (event, emit) async {
        try {
          emit(LoadingAuthState());
          await Future.delayed(const Duration(seconds: 1));
          await _authRepo.resetPassword(email: event.email);
          emit(SuccessAuthState('Ссылка для сброса пароля была отправлена'));
        } on FirebaseException catch (e) {
          emit(ErrorAuthState(error: e.message.toString()));
        }
      },
    );
  }

  final AuthRepo _authRepo;
}

abstract class AuthEvent {}

class SignUp extends AuthEvent {
  SignUp({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}

class SignIn extends AuthEvent {
  SignIn({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}

class ResetPassword extends AuthEvent {
  ResetPassword({
    required this.email,
  });
  final String email;
}

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  SuccessAuthState(this.text);
  final String text;
}

class ErrorAuthState extends AuthState {
  ErrorAuthState({required this.error});
  final String error;
}
