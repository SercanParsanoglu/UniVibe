// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../input_base.dart';

class _InputPhone extends StatefulWidget {
  final TextEditingController textEditingController;
  final dynamic Function(PhoneNumber phoneNumber)? onChanged;
  final String? hintText;
  final InputDecoration? inputDecoration;

  const _InputPhone({
    super.key,
    required this.textEditingController,
    this.onChanged,
    this.hintText,
    this.inputDecoration,
  });

  @override
  State<_InputPhone> createState() => __InputPhoneState();
}

class __InputPhoneState extends State<_InputPhone> {
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
    return PhoneFormField(
      initialValue: PhoneNumber.parse('+90'), // or use the controller
      validator: PhoneValidator.compose(
        [
          PhoneValidator.required(context,
              errorText: "Telefon numarası alanı zorunludur."),
          PhoneValidator.validMobile(context,
              errorText: 'Geçersiz telefon numarası'),
        ],
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      countrySelectorNavigator:
          const CountrySelectorNavigator.draggableBottomSheet(
        favorites: [IsoCode.TR],
      ),
      decoration: widget.inputDecoration ?? _customInputDecoration(),
      onChanged: widget.onChanged,
      isCountrySelectionEnabled: true,
      onTapOutside: (event) => _textFieldFocus.unfocus(),
      focusNode: _textFieldFocus,
      countryButtonStyle: CountryButtonStyle(
        padding: EdgeInsets.only(left: 20.w),
        showDialCode: true,
        showFlag: true,
      ),
    )
        /* IntlPhoneField(
      controller: textEditingController,
      initialCountryCode: 'TR',
      focusNode: _textFieldFocus,
      autovalidateMode: AutovalidateMode.always,
      dropdownIconPosition: IconPosition.trailing,
      searchText: 'Ülke',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      invalidNumberMessage: 'Geçersiz telefon numarası',
      flagsButtonPadding: const EdgeInsets.only(left: 10),
      dropdownIcon: const Icon(
        FontAwesomeIcons.chevronDown,
        size: 16,
      ),
      decoration: _customInputDecoration(),
      languageCode: "tr",
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: $country.');
      },
    ) */
        ;
  }

  InputDecoration _customInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? 'Telefon numarası',
      suffixIcon: const Icon(FontAwesomeIcons.phone),
      fillColor: isFocused
          ? Theme.of(context).inputDecorationTheme.focusColor
          : Theme.of(context).inputDecorationTheme.fillColor,
      filled: true,
      enabled: true,
      isCollapsed: true,
    );
  }
}
