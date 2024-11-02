// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../input_base.dart';

class _InputDigit extends StatefulWidget {
  final TextEditingController textEditingController;
  final void Function(String)? onCompleted;

  const _InputDigit({
    super.key,
    required this.textEditingController,
    this.onCompleted,
  });

  @override
  State<_InputDigit> createState() => __InputDigitState();
}

class __InputDigitState extends State<_InputDigit> {
  final FocusNode _textFieldFocus = FocusNode();
  TextEditingController? textEditingController;

  @override
  void initState() {
    textEditingController = widget.textEditingController;
    super.initState();
  }

  @override
  void dispose() {
    _textFieldFocus.dispose();
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: widget.onCompleted,
      controller: widget.textEditingController,
      focusNode: _textFieldFocus,
      length: 6,
      autofocus: true,
      onTapOutside: (event) => _textFieldFocus.unfocus(),
      validator: (s) {
        return s == '123456' ? null : 'Kod yanlış';
      },
      defaultPinTheme: _customPinTheme(
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      submittedPinTheme: _customPinTheme(
        decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.focusColor,
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      disabledPinTheme: _customPinTheme(
        decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.focusColor,
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      errorPinTheme: _customPinTheme(
        decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.focusColor,
          border:
              Border.all(color: Theme.of(context).colorScheme.error, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  PinTheme _customPinTheme({BoxDecoration? decoration}) {
    return PinTheme(
      width: 56.w,
      height: 56.w,
      textStyle: Theme.of(context).textTheme.titleLarge,
      decoration: decoration,
    );
  }
}
