import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginValidation extends LoginState {
  String? value;

  LoginValidation(this.value);

  @override
  List<Object> get props => [value!];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoaded extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  String? error;

  LoginError({required this.error});

  @override
  List<Object?> get props => [error];
}

class LoginSuccess extends LoginState {
  dynamic data;

  LoginSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}
