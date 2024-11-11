// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element
part of '../input_base.dart';

// ignore: must_be_immutable
class _InputBasic extends StatefulWidget {
  final int? maxTextLength;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final int? maxLines;
  final String? Function(String? val)? validation;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;
  TextEditingController? textEditingController;
  final TextCapitalization? textCapitalization;
  final InputDecoration? inputDecoration;
  final OutlineInputBorder? outlineInputBorder;

  _InputBasic(
      {super.key,
      this.textCapitalization,
      this.maxTextLength,
      this.textInputAction,
      this.inputFormatters,
      this.validation,
      this.hintText,
      this.suffixIcon,
      this.maxLines,
      this.keyboardType,
      this.textEditingController,
      this.inputDecoration,
      this.outlineInputBorder});

  @override
  State<_InputBasic> createState() => _InputBasicState();
}

class _InputBasicState extends State<_InputBasic> {
  final FocusNode _textFieldFocus = FocusNode();
  bool isValid = false;
  bool _isFocused = false;
  bool isValidateFinish = false;
  bool isSecure = true;
  int? maxLines;
  _InputBasicState({this.maxLines});
  @override
  void initState() {
    widget.textEditingController ??= TextEditingController();
    _textFieldFocus.addListener(() {
      setState(() {
        _isFocused = _textFieldFocus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _textFieldFocus.dispose();
    widget.textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //? Widget oluşturulduğunda metin doluysa isValid ve isValidateFinish durumunu ayarlamak için
    if (widget.textEditingController!.text.isNotEmpty) {
      _isFocused = true;
      isValid ? isValidateFinish = true : null;
    }
    //?
    return Column(
      children: [
        TextFormField(
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.words,
          maxLengthEnforcement:
              MaxLengthEnforcement.truncateAfterCompositionEnds,
          onTapOutside: (event) => _textFieldFocus.unfocus(),
          inputFormatters: widget.inputFormatters == null
              ? [
                  FilteringTextInputFormatter.deny(RegExp(r'^\s')),
                  FilteringTextInputFormatter.deny(RegExp(r' (?= )')),
                  LengthLimitingTextInputFormatter(
                      widget.maxTextLength ?? 1000),
                ]
              : widget.inputFormatters! +
                  [
                    FilteringTextInputFormatter.deny(RegExp(r'^\s')),
                    FilteringTextInputFormatter.deny(RegExp(r' (?= )')),
                    LengthLimitingTextInputFormatter(
                        widget.maxTextLength ?? 1000),
                  ],
          keyboardType: widget.keyboardType ?? TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.textEditingController,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          validator: widget.validation,
          decoration: widget.inputDecoration ??
              _customInputDecoration(widget.outlineInputBorder),
          focusNode: _textFieldFocus,
          maxLines: maxLines ?? 1,
          minLines: 1,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  InputDecoration _customInputDecoration(
      OutlineInputBorder? outlineInputBorder) {
    print(outlineInputBorder == null);
    return InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
      hintText: widget.hintText,
      suffixIcon: widget.suffixIcon,
      fillColor: _isFocused
          ? Theme.of(context).inputDecorationTheme.focusColor
          : Theme.of(context).inputDecorationTheme.fillColor,
      filled: true,
      enabled: true,
      isCollapsed: true,
    );
  }

  void changeLoading() {
    setState(() {
      isSecure = !isSecure;
    });
  }
}
