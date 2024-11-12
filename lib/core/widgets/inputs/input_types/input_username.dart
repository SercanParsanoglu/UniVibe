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
  final LowercaseTextInputFormatter _lowercaseFormatter =
      LowercaseTextInputFormatter();

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
      inputFormatters: [
        FilteringTextInputFormatter.deny(
          RegExp(' '),
        ),
        LengthLimitingTextInputFormatter(30),
        _lowercaseFormatter,
        _UsernameTextFFFormatter(),
        FilteringTextInputFormatter.deny(RegExp(r'[^\w@\.]')),
        FilteringTextInputFormatter.deny(RegExp(r'[ğüşıöçĞÜŞİÖÇ@]')),
        FilteringTextInputFormatter.deny(
          RegExp(
              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      focusNode: _textFieldFocus,
      decoration: widget.inputDecoration ?? _customInputDecoration(),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
              errorText: "Kullanıcı adı alanı zorunludur."),
          FormBuilderValidators.username(
              allowSpace: true,
              allowDots: true,
              errorText: "Geçersiz kullanıcı adı."),
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

//! Girilen metni otomatik olarak küçük harfe çevirir.

class LowercaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toLowerCase());
  }
}

class _UsernameTextFFFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains('.') &&
        newValue.text.substring(newValue.text.indexOf('.') + 1).contains('.')) {
      return oldValue;
    } else if (newValue.text.contains('____')) {
      return oldValue;
    }
    return newValue;
  }
}
