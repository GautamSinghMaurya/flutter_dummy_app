import 'package:demo_flutter_app/network/app_services.dart';
import 'package:demo_flutter_app/network/dio_client.dart';
import 'package:demo_flutter_app/network/url.dart';
import 'package:demo_flutter_app/repository_impl/repository/login_repo.dart';

class LoginRepositoryImpl extends LoginRepository {
  final AppServices appServices;

  LoginRepositoryImpl({required this.appServices});

  @override
  login(String email, String password) {
   var requestBody = {"email":email, "password":password};
   appServices.login(requestBody);
  }


}