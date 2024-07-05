import 'package:equatable/equatable.dart';

abstract class ForgetPasswordEvent extends Equatable {
  List<Object?> get props => [];
}

class ForgetPasswordSubmitted extends ForgetPasswordEvent {
  String? email;

  ForgetPasswordSubmitted({this.email});

  @override
  List<Object?> get props => [email];
}
