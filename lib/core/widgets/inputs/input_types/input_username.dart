// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../input_base.dart';

class _InputUsername extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final InputDecoration? inputDecoration;

  const _InputUsername({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.inputDecoration,
  });

  @override
  State<_InputUsername> createState() => __InputUsernameState();
}

class __InputUsernameState extends State<_InputUsername> {
  final FocusNode _textFieldFocus = FocusNode();
  bool isFocused = false;
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
      name: 'username',
      onTapOutside: (event) => _textFieldFocus.unfocus(),
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      focusNode: _textFieldFocus,
      decoration: widget.inputDecoration ?? _customInputDecoration(),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
              errorText: "Username alanı zorunludur."),
          FormBuilderValidators.username(
              allowDots: true, errorText: "Geçersiz kullanıcı adı."),
        ],
      ),
    );
  }

  InputDecoration _customInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? 'Kullanıcı adı',
      suffixIcon: const Icon(FontAwesomeIcons.user),
      fillColor: isFocused
          ? Theme.of(context).inputDecorationTheme.focusColor
          : Theme.of(context).inputDecorationTheme.fillColor,
      filled: true,
      enabled: true,
      isCollapsed: true,
    );
  }
}
