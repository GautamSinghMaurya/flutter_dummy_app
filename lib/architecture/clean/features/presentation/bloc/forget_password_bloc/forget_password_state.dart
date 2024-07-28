import 'package:equatable/equatable.dart';

abstract class ForgetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordValidation extends ForgetPasswordState {
  String value;

  ForgetPasswordValidation({required this.value});

  @override
  List<Object?> get props => [value];
}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordLoaded extends ForgetPasswordState {}

class ForgetPasswordError extends ForgetPasswordState {
  String? error;

  ForgetPasswordError({this.error});

  @override
  List<Object?> get props => [error];
}
