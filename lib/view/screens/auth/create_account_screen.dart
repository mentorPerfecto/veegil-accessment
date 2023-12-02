import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/repository/backend/auth_backend.dart';
import 'package:veegil_accessment/src/components.dart';
import 'package:veegil_accessment/src/screens.dart';
import 'package:veegil_accessment/src/utils.dart';
import 'package:veegil_accessment/view_model/auth_view_model.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  bool isChecked = false;
  bool obscurePasswordText = true;
  bool obscureConfirmPasswordText = true;
  FocusNode phoneNoFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  FocusNode roleFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  bool? isSelectedRole;
  String? selectedRole;
  List<RoleClass>? roles;
  final authService = AuthBackend();

  @override
  void initState() {
    roles = [
      RoleClass('Male', false),
      RoleClass('Female', false),

      // Add more banks here...
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                headerTexts(),
                SizedBox(
                  height: 30.h,
                ),
                formFields(),
                SizedBox(
                  height: 12.h,
                ),
                // termsAndPolicies(),
                SizedBox(
                  height: 190.h,
                ),
                submitButton(),
                SizedBox(
                  height: 28.h,
                ),
                alreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),

      // bottomSheet: Padding(
      //     padding: EdgeInsets.only(bottom: 20.h),
      //     child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: submitButton(),)),
    );
  }

  //This contains the Back Button and Header Texts
  Widget headerTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              navigateBack(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        SizedBox(
          height: 15.h,
        ),
        TextView(
          text: createAnAccount,
          fontSize: 28.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 6.h,
        ),
        TextView(
          text: joinTheCommunity,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  //Contains a list of form fields
  Widget formFields() {
    var provider = ref.watch(authViewModel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          fieldLabel: '',
          focusNode: phoneNoFocusNode,
          hint: "Phone Number",
          controller: provider.phoneNoSignUpController,
          // validator: ref.watch(authViewModel).validators.validateEmail,
        ),
        CustomTextField(
          fieldLabel: '',
          focusNode: passwordFocusNode,
          hint: "Password",
          password: true,
          controller: provider.passwordRegisterController,
          obscureInput: obscurePasswordText,
          onObscureText: () {
            togglePassWordVisibility();
          },
        ),
        CustomTextField(
          fieldLabel: '',
          focusNode: confirmPasswordFocusNode,
          hint: "Confirm Password",
          visibleField: true,
          password: true,
          controller: provider.passwordConfirmRegisterController,
          obscureInput: obscureConfirmPasswordText,
          onObscureText: () {
            toggleConfirmPassWordVisibility();
          },
          // useForgotPass: true,
        ),
      ],
    );
  }

  //Contains custom button
  submitButton() {
    var provider = ref.watch(authViewModel);
    return DefaultButtonMain(
      text: 'Create account',
      buttonState: provider.buttonRegisterState!.buttonState,
      onPressed: () async { await provider.userRegistration(context);
      },
    );
  }

  //Contains alreadyHaveAnAccount text widget
  alreadyHaveAnAccount() {
    return Center(
      child: RichText(
          text: TextSpan(
              text: haveAnAccount,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Campton',
                  fontWeight: FontWeight.w500),
              children: <TextSpan>[
            TextSpan(
                text: login,
                style: TextStyle(
                    color: AppColors.kBlue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()))),
          ])),
    );
  }

  //Contains termsAndPolicies text widget
  termsAndPolicies() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customCheckBox(),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: RichText(
              text: TextSpan(
                  text: agreeTo,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                TextSpan(
                    text: termsOfService,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.kBlue.withOpacity(0.8),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                const TextSpan(
                  text: acknowledgement,
                ),
                TextSpan(
                    text: privacyPolicy,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.kBlue.withOpacity(0.8),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                const TextSpan(
                  text: ' applies to you.',
                ),
              ])),
        ),
      ],
    );
  }

  //Contains customCheckBox widget
  customCheckBox() {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 18.w, // Adjust the size of the checkbox
        height: 18.h, // Adjust the size of the checkbox
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r), // Set the border radius
          border: Border.all(
            color: AppColors.kBlue, // Border color
            width: 1.w, // Border width
          ),
          color: isChecked
              ? Colors.transparent
              : Colors.transparent, // Fill color when checked
        ),
        child: isChecked
            ? Center(
                child: Icon(
                  Icons.check,
                  size: 12.0.r,
                  color: AppColors.kBlue, // Checkmark color
                ),
              )
            : null,
      ),
    );
  }

  //Contains togglePassWordVisibility for password form field widget
  togglePassWordVisibility() {
    setState(() {
      obscurePasswordText = !obscurePasswordText;
    });
  }

  toggleConfirmPassWordVisibility() {
    setState(() {
      obscureConfirmPasswordText = !obscureConfirmPasswordText;
    });
  }

  rolePopUp() async {
    final deviceW = MediaQuery.of(context).size.width;
    final deviceH = MediaQuery.of(context).size.height;

    final selectedGenderValue = await showModalBottomSheet<String>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(deviceH * 0.04))),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(
                left: deviceW * 0.08,
                right: deviceW * 0.08,
                bottom: deviceH * 0.01),
            padding: EdgeInsets.only(top: deviceH * 0.01),
            height: 280.h,
            width: deviceW / 1.75,
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: deviceH * 0.03,
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                      onTap: () {
                        navigateBack(context);
                      },
                      child: Container(
                          alignment: Alignment.topRight,
                          child: const Icon(Icons.keyboard_arrow_down_outlined)),
                    ),
                  ]),

                  // Text(title, textAlign: TextAlign.center, style: kTitleStyle,),
                  const TextView(
                    text: "Select role",
                  ),

                  SizedBox(
                    height: deviceH * 0.02,
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 150.h,
                        child: ListView.builder(
                          itemCount: roles!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: MaterialButton(
                                height: 52.h,
                                minWidth: double.infinity,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r)),
                                color: roles![index].isSelected
                                    ? AppColors.kBlue
                                    : null,
                                onPressed: () {
                                  _selectRole(index);
                                  Navigator.of(context).pop(roles![index].role);
                                },
                                child: TextView(
                                  text: roles![index].role,
                                  fontSize: 14.r,
                                  color: roles![index].isSelected
                                      ? Colors.white
                                      : Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
    if (selectedGenderValue != null) {
      setState(() {
        selectedRole = selectedGenderValue;
        // isSelected = true;
      });
    }
  }

  void _selectRole(int index) {
    setState(() {
      // Set isSelected property of the selected bank to true
      roles![index].isSelected = true;

      // Set isSelected property of all other banks to false
      for (int i = 0; i < roles!.length; i++) {
        if (i != index) {
          roles![i].isSelected = false;
        }
      }
    });
  }

}

class MyForm extends ConsumerStatefulWidget {
  const MyForm({super.key});

  @override
  ConsumerState<MyForm> createState() => _MyFormState();
}

class _MyFormState extends ConsumerState<MyForm> {
  final TextEditingController _controller = TextEditingController();
  bool showError = false;
  String? errorText;
  final FocusNode _focusNode = FocusNode();
  // Validators get validators =>  _validators;
  final Validators validators = Validators();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: 'Enter text',
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: showError ? Colors.red : Colors.blue),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            onChanged: (text) {
              setState(() {
                errorText = validators.validateEmail(text);
                showError = errorText != null;
              });
            },
          ),
          if (showError && _focusNode.hasFocus)
            Text(
              // errorText ?? '',
              validators.validateEmail(_controller.text) ?? '',
              style: const TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}

class RoleClass {
  final String role;
  // final String code;
  bool isSelected;

  RoleClass(this.role, this.isSelected);
}
