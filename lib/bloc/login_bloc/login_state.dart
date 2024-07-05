import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginValidation extends LoginState {
  String? value;

  LoginValidation(this.value);

  @override
  List<Object> get props => [value!];
}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginError extends LoginState {
  String? error;

  LoginError({required this.error});

  @override
  List<Object?> get props => [error];
}
