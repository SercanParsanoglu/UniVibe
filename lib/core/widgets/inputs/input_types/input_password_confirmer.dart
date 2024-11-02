// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../input_base.dart';

class _InputPasswordConfirmer extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextEditingController originalPasswordController;
  final String? hintText;
  final InputDecoration? inputDecoration;

  const _InputPasswordConfirmer({
    super.key,
    required this.textEditingController,
    required this.originalPasswordController,
    this.hintText,
    this.inputDecoration,
  });

  @override
  State<_InputPasswordConfirmer> createState() =>
      __InputPasswordConfirmerState();
}

class __InputPasswordConfirmerState extends State<_InputPasswordConfirmer> {
  final FocusNode _textFieldFocus = FocusNode();
  bool isFocused = false;
  bool isSecure = true;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      setState(() => isFocused = _textFieldFocus.hasFocus);
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
      name: 'password_confirmer',
      onTapOutside: (event) => _textFieldFocus.unfocus(),
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.textEditingController,
      focusNode: _textFieldFocus,
      obscureText: isSecure,
      decoration: widget.inputDecoration ?? _customInputDecoration(),
      validator: (value) {
        if (value != widget.originalPasswordController.text) {
          return 'Şifreler eşleşmiyor.';
        }
        return null;
      },
    );
  }

  InputDecoration _customInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? 'Şifre tekrarı',
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
