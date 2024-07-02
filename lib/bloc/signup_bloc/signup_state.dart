import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupValidation extends SignupState {
  String? value;
  SignupValidation(this.value);

  @override
  List<Object> get props => [value!];

}

class SignupLoading extends SignupState {
  @override
  List<Object> get props => [];}

class SignupLoaded extends SignupState {}

class SignupError extends SignupState {}
