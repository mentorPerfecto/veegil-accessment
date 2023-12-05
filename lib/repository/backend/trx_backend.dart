
import 'package:veegil_accessment/repository/services/api/api_service.dart';

class TransactionBackend extends ApiService {
  Future<dynamic> transferFunds({
    required String phone,
    required String amount,
  }) async {
    return postMth(
      transferUri,
      headers: apiHeader,
      body: {'phoneNumber': phone, 'amount': amount},
    );
  }



  Future<dynamic> withdrawFunds({
    required String phone,
    required String amount,
  }) async {
    return postMth(
      withdrawUri,
      headers: apiHeader,
      body: {'phoneNumber': phone, 'amount': amount},
    );
  }



  Future<dynamic> fetchTransactions() async {
    return getMth(
      transactionsUri,
      headers: apiHeader,
    );
  }

  Future<dynamic> fetchAcctBalance() async {
    return getMth(
      acctBalanceUri,
      headers: apiHeader,
    );
  }
}
