// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/src/models.dart';
import 'package:veegil_accessment/src/repository.dart';
import 'package:veegil_accessment/src/screens.dart';
import 'package:veegil_accessment/src/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:veegil_accessment/view/screens/dashboard/dashboard_screen.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());

class AuthViewModel extends ChangeNotifier {
  late SharedPreferences sharedPreferences;

  final TextEditingController _phoneNoController =
      TextEditingController(text: DummyData.phoneNumber.toString());
  final TextEditingController _phoneNoSignUpController = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRegisterController =
      TextEditingController();
  final TextEditingController _passwordConfirmRegisterController =
      TextEditingController();
  final TextEditingController _forgotPasswordEmailController =
      TextEditingController();

  final TextEditingController _resetPasswordConfirmController =
      TextEditingController();
  final TextEditingController _resetPasswordPasswordController =
      TextEditingController();
  final TextEditingController _resetPasswordOtpController =
      TextEditingController();
  final Validators _validators = Validators();
  bool _loginObscurePass = true;
  final bool _resetPassObscurePass = true;
  final bool _resetConfirmPassObscurePass = true;
  final authService = AuthBackend();
  final loginFormKey = GlobalKey<FormState>();
  final forgotPassFormKey = GlobalKey<FormState>();
  final resetPassFormKey = GlobalKey<FormState>();

  CustomButtonState _buttonState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: login,
  );

  CustomButtonState _buttonRegisterState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: login,
  );
  CustomButtonState _buttonConfirmAccountState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: login,
  );

  TextEditingController get phoneNoController => _phoneNoController;
  Validators get validators => _validators;
  TextEditingController get phoneNoSignUpController => _phoneNoSignUpController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordRegisterController =>
      _passwordRegisterController;
  TextEditingController get passwordConfirmRegisterController =>
      _passwordConfirmRegisterController;
  TextEditingController get forgotPasswordEmailController =>
      _forgotPasswordEmailController;
  TextEditingController get resetPasswordConfirmController =>
      _resetPasswordConfirmController;
  TextEditingController get resetPasswordPasswordController =>
      _resetPasswordPasswordController;
  TextEditingController get resetPasswordOtpController =>
      _resetPasswordOtpController;
  bool get loginObscurePass => _loginObscurePass;
  bool get resetPassObscurePass => _resetPassObscurePass;
  bool get resetConfirmPassObscurePass => _resetConfirmPassObscurePass;
  CustomButtonState? get buttonState => _buttonState;
  CustomButtonState? get buttonRegisterState => _buttonRegisterState;
  CustomButtonState? get buttonConfirmAccountState => _buttonConfirmAccountState;

  togglePassWordVisibility() {
    _loginObscurePass = !_loginObscurePass;
    notifyListeners();
  }

  void updateButtonState() {
    final emailValidationResult =
        _validators.validatePhoneNumber(_phoneNoController.text);

    if (emailValidationResult != null || passwordController.text.isEmpty) {
      _buttonState = CustomButtonState(
        buttonState: ButtonState.disabled,
        text: login,
      );
    } else {
      _buttonState = CustomButtonState(
        buttonState: ButtonState.idle,
        text: login,
      );
    }
    notifyListeners();
  }

  void updateRegisterButtonState() {
    final emailValidationResult =
        _validators.validatePhoneNumber(_phoneNoSignUpController.text);
    if (emailValidationResult != null ||
        passwordRegisterController.text.length < 4 || passwordRegisterController.text != passwordConfirmRegisterController.text ) {
      _buttonRegisterState = CustomButtonState(
        buttonState: ButtonState.disabled,
        text: login,
      );
    } else {
      _buttonRegisterState = CustomButtonState(
        buttonState: ButtonState.idle,
        text: login,
      );
    }
    notifyListeners();
  }

  void updateConfirmButtonState() {
      _buttonConfirmAccountState = CustomButtonState(
        buttonState: ButtonState.idle,
        text: login,
      );
    notifyListeners();
  } 

  AuthViewModel() {
    _phoneNoController.addListener(() {
      updateButtonState();
    });
    _passwordController.addListener(() {
      updateButtonState();
    });
    _phoneNoSignUpController.addListener(() {
      updateRegisterButtonState();
    });
    _userNameController.addListener(() {
      updateRegisterButtonState();
    });

    _passwordConfirmRegisterController.addListener(() {
      updateRegisterButtonState();
    });
    _firstNameController.addListener(() {
      updateRegisterButtonState();
    });
    _lastNameController.addListener(() {
      updateRegisterButtonState();
    });
    passwordRegisterController.addListener(() {
      updateRegisterButtonState();
    });
  }

  Future<void> userLogin(BuildContext context) async {
    try {
      _buttonState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: login,
      );
      notifyListeners();
      await authService
          .signInAdmin(
        phone: _phoneNoController.text,
        password: _passwordController.text,
      )
          .then((value) async {
        if (value != null) {

          if (value['status'].toString() == 'success') {

            showToast(
              msg: 'Login successful',
              isError: false,
            );
            _buttonState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: login,
            );
            DummyData.phoneNumber = _phoneNoSignUpController.text;

            DummyData.password = passwordRegisterController.text;

            await saveUserPhone(_phoneNoController.text);
            await getUserPhoneNumber();
            await saveAppTme();
            await saveUserPassword(_passwordController.text);
            await getUserPassword();
            await Future.delayed(const Duration(milliseconds: 1000));

            await navigateReplace(context, const DashboardScreen());
          } else if (value['status'].toString() == 'error') {
            showToast(
              msg: 'Incorrect login credentials',
              isError: true,
            );
            notifyListeners();
          }
        }
      }).whenComplete(() {
        _buttonState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: 'getStarted',
        );
        notifyListeners();
      });
    } catch (e, s) {
      showToast(
        msg: 'Something went wrong',
        isError: true,
      );
      logger
        ..i('CHECK ERROR LOGS')
        ..e(s);
    }
  }

  Future<void> userRegistration(BuildContext context) async {
    try {
      _buttonRegisterState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: login,
      );
      notifyListeners();
      await authService
          .signUp(
        phone: _phoneNoSignUpController.text,
        password: _passwordRegisterController.text)
          .then((value) async {
        if (value != null) {
          // print(value['status'].toString());
          //   final decodeResponse = jsonDecode(value.toString());
          final decodeResponse = value;
          logger.w(decodeResponse);
          if (value['status'].toString() == 'success') {
            logger.f(value.toString());
            _buttonRegisterState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: login,
            );

            showToast(
              msg: value['message'].toString(),
              isError: false,
            );
            await Future.delayed(const Duration(milliseconds: 1000));
           userLogin(context);
          } else if (value['status'].toString() == 'error') {
            showToast(
              msg: value['message'].toString(),
              isError: true,
            );
            notifyListeners();
          }
        }
      }).whenComplete(() {
        _buttonRegisterState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: 'getStarted',
        );
        notifyListeners();
      });
    } catch (e, s) {
      showToast(
        msg: 'Something went wrong',
        isError: true,
      );
      logger
        ..i('CHECK ERROR LOGS')
        ..e(s);
    }
  }
  saveUserPhone(localUserPhone) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("PhoneNumber", localUserPhone);
    logger.i("saved Email Address ${DummyData.phoneNumber}");
  }

  saveUserPassword(localPassword) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Password", localPassword);
    logger.i("saved Password");
  }

  getUserPhoneNumber() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.phoneNumber = sharedPreferences.getString("PhoneNumber");
    logger.i("get Phone Number Address ${DummyData.phoneNumber}");
  }

  getUserPassword() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.password = sharedPreferences.getString("Password");
    logger.i("get Password ${DummyData.password}");
  }

  saveAccessToken(accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", accessToken);
    logger.i("saved accessToken");
  }

  saveRefreshToken(refreshToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("refreshToken", refreshToken);
    logger.i("saved refreshToken");
  }

  saveAppTme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("firstTimeOnApp", false);
    logger.i("saved firstTimeOnApp");
  }

  getAccessToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.accessToken = sharedPreferences.getString("accessToken");
    log("get accessToken : ${DummyData.accessToken}");
  }
}
