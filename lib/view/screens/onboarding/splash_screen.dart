import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/src/providers.dart';
import 'package:veegil_accessment/config/app_colors.dart';
import 'package:veegil_accessment/src/screens.dart';
import 'package:veegil_accessment/view_model/auth_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void initState() {
    super.initState();
    
    // Use Future.delayed to update the providers after the widget is built
    Future.delayed(Duration.zero, () {
      // ref.watch(authViewModel).getUserPhoneNumber();
      // ref.watch(authViewModel).getUserPassword();
      ref.watch(onboardingViewModel).checkUser(context);
      ref.watch(authViewModel).updateButtonState();
      ref.watch(authViewModel).updateRegisterButtonState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kTextBlack,
      body: Center(
          child: SizedBox(
        width: 208.w,
        height: 101.h,
        child: const Icon(Icons.flutter_dash_outlined),
      )),
    );
  }
}
