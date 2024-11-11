import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:pinput/pinput.dart';

part 'input_types/input_basic.dart';
part 'input_types/input_digit.dart';
part 'input_types/input_email.dart';
part 'input_types/input_gender.dart';
part 'input_types/input_password.dart';
part 'input_types/input_password_confirmer.dart';
part 'input_types/input_phone.dart';
part 'input_types/input_username.dart';

enum InputEnum {
  password,
  phone,
  digit,
  username,
  email,
  passwordConfirmer,
  gender,
  basic,
}

mixin InputType {
  static const username = InputEnum.username;
  static const email = InputEnum.email;
  static const password = InputEnum.password;
  static const passwordConfirmer = InputEnum.passwordConfirmer;
  static const gender = InputEnum.gender;
  static const digit = InputEnum.digit;
  static const phone = InputEnum.phone;
  static const basic = InputEnum.basic;
}

class InputBase extends StatelessWidget {
  final InputEnum textFFType;
  final TextEditingController textEditingController;
  final TextEditingController? originalPasswordController;
  final String? Function(String? val)? validation;
  final void Function(String val)? onCompleted;
  final dynamic Function(PhoneNumber phoneNumber)? onChanged;
  final List<String>? genderItems;
  final String? hintText;
  final InputDecoration? inputDecoration;
  final OutlineInputBorder? outlineInputBorder;
  const InputBase({
    super.key,
    required this.textFFType,
    required this.textEditingController,
    this.originalPasswordController,
    this.validation,
    this.onCompleted,
    this.onChanged,
    this.outlineInputBorder,
    this.genderItems,
    this.hintText,
    this.inputDecoration,
  });

  @override
  Widget build(BuildContext context) {
    late Widget returnWidget;
    switch (textFFType) {
      case InputEnum.username:
        returnWidget = _InputUsername(
          textEditingController: textEditingController,
          hintText: hintText,
          inputDecoration: inputDecoration,
        );
        break;
      case InputEnum.email:
        returnWidget = _InputEmail(
          outlineInputBorder: outlineInputBorder,
          textEditingController: textEditingController,
          hintText: hintText,
          inputDecoration: inputDecoration,
        );
        break;
      case InputEnum.password:
        returnWidget = _InputPassword(
          textEditingController: textEditingController,
          hintText: hintText,
          inputDecoration: inputDecoration,
        );
        break;
      case InputEnum.passwordConfirmer:
        returnWidget = _InputPasswordConfirmer(
          textEditingController: textEditingController,
          originalPasswordController: originalPasswordController!,
          hintText: hintText,
          inputDecoration: inputDecoration,
        );
        break;
      case InputEnum.basic:
        returnWidget = _InputBasic(
          outlineInputBorder: outlineInputBorder,
          textEditingController: textEditingController,
          hintText: hintText,
          validation: validation,
          inputDecoration: inputDecoration,
        );
        break;
      case InputEnum.digit:
        returnWidget = _InputDigit(
          textEditingController: textEditingController,
          onCompleted: onCompleted,
        );
        break;
      case InputEnum.gender:
        returnWidget = _InputGender(
          items: genderItems,
          onCompleted: onCompleted,
        );
        break;

      case InputEnum.phone:
        returnWidget = _InputPhone(
          textEditingController: textEditingController,
          hintText: hintText,
          onChanged: onChanged,
          inputDecoration: inputDecoration,
        );
        break;

      default:
        debugPrint('AppLocalizations.of(context)!.textfieldDebugMessage');
    }

    return returnWidget;
  }
}
