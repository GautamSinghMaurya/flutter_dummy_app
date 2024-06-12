abstract class SignupEvent {}

class GetSignup extends SignupEvent {
  String? name;
  String? email;
  String? password;
  String? phone;

  GetSignup({this.name, this.email, this.password, this.phone});
}