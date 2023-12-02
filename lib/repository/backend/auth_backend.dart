// ignore_for_file: use_build_context_synchronously

import 'package:veegil_accessment/repository/services/api/api_service.dart';

class AuthBackend extends ApiService {
  Future<dynamic> signInAdmin({
    required String phone,
    required String password,
  }) async {
    return postMth(
      loginUri,
      headers: apiHeader,
      body: {'phoneNumber': phone, 'password': password},
    );
  }

  Future<dynamic> signUp({
    required String phone,
    required String password,
    // required String role,
  }) async {
    return postMth(
      signUpUri,
      headers: apiHeader,
      body:{'phoneNumber': phone, 'password': password},
    );
  }

}
