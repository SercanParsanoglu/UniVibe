// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../input_base.dart';

class _InputPassword extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final InputDecoration? inputDecoration;

  const _InputPassword({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.inputDecoration,
  });

  @override
  State<_InputPassword> createState() => __InputPasswordState();
}

class __InputPasswordState extends State<_InputPassword> {
  final FocusNode _textFieldFocus = FocusNode();
  bool isFocused = false;
  bool isSecure = true;
  TextEditingController? textEditingController;

  @override
  void initState() {
    textEditingController = widget.textEditingController;
    _textFieldFocus.addListener(() {
      setState(() {
        isFocused = _textFieldFocus.hasFocus;
      });
    });
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
    return FormBuilderTextField(
      name: 'password',
      onTapOutside: (event) => _textFieldFocus.unfocus(),
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      focusNode: _textFieldFocus,
      obscureText: isSecure,
      decoration: widget.inputDecoration ?? _customInputDecoration(),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(errorText: "Şifre alanı zorunludur."),
          FormBuilderValidators.match(RegExp(r'^\S+$'),
              errorText: 'Şifren boşluk içeremez'),
          FormBuilderValidators.password(
              minLength: 6, errorText: 'Şifren daha güçlü olmalı.'),
        ],
      ),
    );
  }

  InputDecoration _customInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? 'Şifre',
      suffixIcon: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          padding: EdgeInsets.zero,
          onPressed: changeSecure,
          icon: isSecure
              ? const Icon(FontAwesomeIcons.eye)
              : const Icon(FontAwesomeIcons.eyeSlash)),
      fillColor: isFocused
          ? Theme.of(context).inputDecorationTheme.focusColor
          : Theme.of(context).inputDecorationTheme.fillColor,
      filled: true,
      enabled: true,
      isCollapsed: true,
    );
  }

  void changeSecure() {
    setState(() {
      isSecure = !isSecure;
    });
  }
}
