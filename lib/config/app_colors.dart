import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color(0xff09132D);
  static const kPrimary2 = Color(0xff121E4A);
  static const kAshBlue = Color(0xffB2BAD1);
  static const kWhite = Color(0xFFFFFFFF);
  static const kBlue = Color(0xff0065FF);
  static const kTextBlack = Color(0xff101010);
  static const kTextGrey = Color(0xff474747);
  static const kFormfieldBlueFill = Color(0xffF8FBFF);
  static const kFormfieldBlueBorder = Color(0xffE6F0FF);
  static const kFormfieldBlueBorderFocused = Color(0xffE6F0FF);
  static const kErrorPrimary = Color(0xffFF2A1F);
  static const kTransparent = Colors.transparent;
  static const kNeutral = Color(0xffC3C3C3);

  static const kBlack = Colors.black;
  static const kCircularProgressIndicatorBackgroundColor = Color(0xffCFD8DC);
  static const kUserProfileNeutral = Color(0xff707070);
  static const kDivider = Color(0xffECECEC);
  static const kLinearGradient1 = Color(0xff0065FF);
  static const kLinearGradient2 = Color(0xff952BDA);
  static const kLinearGradient3 = Color(0xffFE02BF);
  static const kPinkRating = Color(0xffFBD3F5);
  static const kPurpleRating = Color(0xff9B0175);

  static const kNeutralFormFieldText = Color(0xff9B9B9B);
  static const kNeutralTextGrey = Color(0xff707070);
  static const kPurple = Color(0xFF952BDA);
  static const LinearGradient gradientMain = LinearGradient(
    colors: [
      Color(0xFF0065FF), Color(0xFF952BDA)
      // ,Color(0xFFFE02BF)
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient disabledGradient = LinearGradient(
    colors: [
      Color(0xFFC0C0C0),
      Color(0xFFC0C0C0),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient transparentGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
    ],
  );
  static const kLightBlue = Color(0xffE6F0FF);
  static const kNeutralBlack = Color(0xff474747);
  static const kCircleAvatar = Color(0xffCED7E4);
  static const kLightPink = Color(0xffFFE6F9);
  static const kBorderColor = Color(0xffE6F0FF);
  static const kBorderFillColor = Color(0xffF8FBFF);
  static const kCircleNeutralColor = Color(0xff9B9B9B);
  static const kTimeAndDate = Color(0xffF4F4F5);
}
