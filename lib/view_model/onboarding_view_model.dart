import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/src/screens.dart';
import 'package:veegil_accessment/src/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final onboardingViewModel = ChangeNotifierProvider((ref) => OnboardingViewModel());

class OnboardingViewModel extends ChangeNotifier {


  late SharedPreferences sharedPreferences;


  checkUser(context) {
    initData().then((onValue) async {

      navigateReplace(context, const LoginScreen());
    });
  }


  Future<void> initData() async {
    await Future<void>.delayed(const Duration(seconds: 3));
  }


}