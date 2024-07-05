import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  List<Object?> get props => [];

}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordValidation extends ResetPasswordState {
  final String value;
  ResetPasswordValidation({required this.value});

  List<Object?> get props => [value];

}
class ResetPasswordLoading extends ResetPasswordState {}
class ResetPasswordLoaded extends ResetPasswordState {}
class ResetPasswordSuccess extends ResetPasswordState {
  bool? result;

  ResetPasswordSuccess({this.result});

  @override
  List<Object?> get props => [result];
}
class ResetPasswordError extends ResetPasswordState {
  String? error;

  ResetPasswordError({this.error});

  @override
  List<Object?> get props => [error];
}