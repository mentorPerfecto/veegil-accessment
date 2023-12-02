
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/repository/backend/trx_backend.dart';
import 'package:veegil_accessment/src/models.dart';
import 'package:veegil_accessment/src/screens.dart';
import 'package:veegil_accessment/src/utils.dart';

final trxViewModel = ChangeNotifierProvider((ref) => OnboardingViewModel());

class OnboardingViewModel extends ChangeNotifier {

  final trxService = TransactionBackend();

  List<TrxResponseModel> trxList = [];
  bool isGettingData = true;

  Future<dynamic> getTransactions() async {

    try {
      await trxService.fetchTransactions()
          .then((value) {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());
          if (decodedResponse['status'] == 'success') {
            var resBody =   decodedResponse as Map<String, dynamic>;
            trxList =  (resBody as List).map((e) => TrxResponseModel.fromJson(e)).toList();
            isGettingData = false;
            notifyListeners();
          }
        }
      }).onError((error, stackTrace) {
        logger
          ..e(error)
          ..e(stackTrace);
      });
    } catch (e) {
      logger.e(e);
    }
  }


}