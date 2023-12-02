
import 'package:veegil_accessment/repository/services/api/api_service.dart';

class TransactionBackend extends ApiService {
  Future<dynamic> transferFunds({
    required String phone,
    required String password,
  }) async {
    return postMth(
      loginUri,
      headers: apiHeader,
      body: {'phoneNumber': phone, 'password': password},
    );
  }



  Future<dynamic> withdrawFunds({
    required String phone,
    required String password,
  }) async {
    return postMth(
      loginUri,
      headers: apiHeader,
      body: {'phoneNumber': phone, 'password': password},
    );
  }



  Future<dynamic> fetchTransactions() async {
    return getMth(
      loginUri,
      headers: apiHeader,
    );
  }
}
