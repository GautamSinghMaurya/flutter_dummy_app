
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/signup_bloc/signup_event.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/signup_bloc/signup_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on((event, emit) async {
      print("event----->$event");

      if (event is DoSignUp) {
        String value = validation(event);
        print("value");
        print(value);
        if (value != "") {
          print("value--->SignupValidation");
          emit(SignupValidation(value));
          // emit(SignupInitial());
        } else {
          print("value--->SignupLoading");
          emit(SignupLoading());
          await Future.delayed(const Duration(seconds: 3), () {
            emit(SignupLoaded());
          });
        }
      }
    });
  }

  validation(DoSignUp data) {
    if (data.name.isEmpty == true) {
      return "Please enter name";
    } else if (data.email.isEmpty == true) {
      return "Please enter email";
    } else if (!EmailValidator.validate(data.email)) {
      return "Please enter valid email";
    } else if (data.password.isEmpty == true) {
      return "Please enter password";
    } else if (data.phone.isEmpty == true) {
      return "Please enter phone";
    } else {
      return "";
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
