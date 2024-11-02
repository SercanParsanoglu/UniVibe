// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../input_base.dart';

class _InputEmail extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final InputDecoration? inputDecoration;

  const _InputEmail({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.inputDecoration,
  });

  @override
  State<_InputEmail> createState() => __InputEmailState();
}

class __InputEmailState extends State<_InputEmail> {
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
      name: 'email',
      onTapOutside: (event) => _textFieldFocus.unfocus(),
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      focusNode: _textFieldFocus,
      decoration: widget.inputDecoration ?? _customInputDecoration(),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(errorText: "Email alanı zorunludur."),
          FormBuilderValidators.email(errorText: 'Geçersiz email.'),
        ],
      ),
    );
  }

  InputDecoration _customInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? 'Email',
      suffixIcon: const Icon(FontAwesomeIcons.envelope),
      fillColor: isFocused
          ? Theme.of(context).inputDecorationTheme.focusColor
          : Theme.of(context).inputDecorationTheme.fillColor,
      filled: true,
      enabled: true,
      isCollapsed: true,
    );
  }
}
