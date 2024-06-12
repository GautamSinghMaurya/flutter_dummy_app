abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupValidation extends SignupState {
  String? value;
  SignupValidation(this.value);
}
class SignupLoading extends SignupState {}
class SignupLoaded extends SignupState {}
class SignupError extends SignupState {}