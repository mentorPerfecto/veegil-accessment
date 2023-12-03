
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
  bool isGettingTrx = false;

  Future<dynamic> getTransactions() async {

    try {
      await trxService.fetchTransactions()
          .then((value) {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());
          if (decodedResponse['status'] == 'success') {
            var resBody =   decodedResponse as Map<String, dynamic>;
            trxList =  (resBody['data'] as List).map((e) => TrxResponseModel.fromJson(e)).toList().reversed.toList();
          }
          isGettingData = false;
          notifyListeners();
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




  Future<dynamic> transfer(context, amount) async {
    isGettingTrx = true;
    notifyListeners();

    try {
      await trxService.transferFunds(amount: amount,
          phone: DummyData.phoneNumber.toString())
          .then((value) async {
        if (value != null) {
          logger.w(value['status']);
          if (value['status'] == 'success') {
            var resBody =   value as Map<String, dynamic>;
            await getTransactions();
            showToast(msg: resBody['message'].toString(), isError: false);
            navigateBack(context);
          }

          isGettingTrx = false;
          notifyListeners();
        }
      }).onError((error, stackTrace) {
        isGettingTrx = false;
        notifyListeners();
        showToast(
          msg: 'Something went wrong',
          isError: true,
        );
        logger
          ..e(error)
          ..e(stackTrace);
      });
    } catch (e) {
      isGettingTrx = false;
      notifyListeners();
      showToast(
        msg: 'Something went wrong',
        isError: true,
      );
      logger.e(e);
    }
  }


  Future<dynamic> withdraw(context, amount) async {
    isGettingTrx = true;
    notifyListeners();

    try {
      await trxService.withdrawFunds(amount: amount,
          phone: DummyData.phoneNumber.toString())
          .then((value) async {
        if (value != null) {
          // final decodedResponse = jsonDecode(value.toString());
          logger.w(value['status']);
          if (value['status'] == 'success') {
            var resBody =   value as Map<String, dynamic>;
            await getTransactions();
            showToast(msg: resBody['message'].toString(), isError: false);
            navigateBack(context);
          }
          isGettingTrx = false;
          notifyListeners();
        }
      }).onError((error, stackTrace) {
        logger
          ..e(error)
          ..e(stackTrace);
        showToast(
          msg: 'Something went wrong',
          isError: true,
        );
        isGettingTrx = false;
        notifyListeners();
      });
    } catch (e) {
      isGettingTrx = false;
      notifyListeners();
      showToast(
        msg: 'Something went wrong',
        isError: true,
      );
      logger.e(e);
    }
  }


}