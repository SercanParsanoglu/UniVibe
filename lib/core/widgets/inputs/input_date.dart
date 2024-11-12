import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_social/translations/locale_keys.g.dart';

enum InputDateValidateEnum { birthday, registrationCertificate, none }

// ignore: must_be_immutable
class InputDate extends StatefulWidget {
  InputDate({
    super.key,
    this.validateType = InputDateValidateEnum.birthday,
    this.hintText,
    this.isMbsWidget = false,
    this.editDatePicker = false,
    this.selectedDate,
    this.onDateSelected,
    this.textEditingController,
  });
  InputDateValidateEnum validateType;
  bool isMbsWidget;
  final String? hintText;
  final bool editDatePicker;
  DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;
  TextEditingController? textEditingController;
  @override
  State<InputDate> createState() => InputDateState();
}

class InputDateState extends State<InputDate> {
  final FocusNode _textFieldFocus = FocusNode();
  bool datePickerNotSelected = false;
  bool isValid = false;
  bool _isFocused = false;
  bool isSecure = true;
  bool isEnabled = false;
  bool isValidateFinish = false;

  String? validText;
  // final TextEditingController _datePickerController = TextEditingController();

  @override
  void initState() {
    widget.textEditingController ??= TextEditingController();
    _textFieldFocus.addListener(() {
      setState(() {
        _isFocused = _textFieldFocus.hasFocus;
      });
    });
    widget.editDatePicker ? isValidateFinish = true : null;
    super.initState();
  }

  @override
  void dispose() {
    _textFieldFocus.dispose();
    widget.textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.selectedDate = widget.selectedDate ??
        DateTime.now().subtract(const Duration(seconds: 410227200));

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyLarge,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.textEditingController,
            enabled: isEnabled,
            validator: (value) {
              return validatorFunction(validText, context);
            },
            decoration: customInputDecoration(context),
            focusNode: _textFieldFocus,
          ),
        ),
      ],
    );
  }
  //!Custom Input Decoration

  InputDecoration customInputDecoration(BuildContext context) {
    return InputDecoration(
      errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
      suffixIcon: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.zero,
        onPressed: () => _selectDate(context),
        icon: const Icon(FontAwesomeIcons.calendarDays),
      ),
      hintText: _isFocused
          ? LocaleKeys.datePickerInputFocusHintText.tr()
          : widget.hintText ?? LocaleKeys.datePickerInputHintText.tr(),
      hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
            color: _isFocused
                ? Colors.red
                : Theme.of(context).inputDecorationTheme.hintStyle!.color,
          ),
      fillColor: isValid
          ? Colors.transparent
          : isValidateFinish && !isValid
              ? widget.isMbsWidget
                  ? Colors.red
                  : Theme.of(context).inputDecorationTheme.focusColor
              : null,
      filled: true,
      isCollapsed: true,
    );
  }

  Future<void> onChangedFuction(value) async {
    isValid = datePickerControl(
          context: context,
          val: value.toString(),
          type: widget.validateType,
        ) !=
        null;
    !isValid ? isValidateFinish = true : null;
    isEnabled = true;
    await Future.delayed(const Duration(milliseconds: 100));
    isEnabled = false;
    setState(() {});
  }

  String? validatorFunction(String? val, BuildContext context) {
    isValid = datePickerControl(
          context: context,
          val: val,
          type: widget.validateType,
        ) !=
        null;
    return datePickerControl(
      context: context,
      val: val,
      type: widget.validateType,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      picked = await showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              minimumDate: DateTime(1930), // Seçilebilecek en erken tarih
              maximumDate: DateTime.now(), // Seçilebilecek en geç tarih
              initialDateTime: widget.selectedDate,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  if (widget.onDateSelected != null) {
                    widget.onDateSelected!(newDate);
                  }
                  widget.selectedDate = newDate;
                  final formattedDate =
                      DateFormat('dd MMMM yyyy', 'tr_TR').format(newDate);

                  widget.textEditingController!.text = formattedDate;
                  validText = DateFormat('dd/MM/yyyy').format(newDate);
                });
              },
            ),
          );
        },
      );
    } else {
      picked = await showDatePicker(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        context: context,
        initialDate: widget.selectedDate, // Use selectedDate here
        firstDate: DateTime(1930), // Seçilebilecek en erken tarih
        lastDate: DateTime.now(), // Seçilebilecek en geç tarih
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).brightness == Brightness.light
                ? ThemeData.light()
                : ThemeData.dark(),
            child: child!,
          );
        },
      );
    }
    if (picked != null && picked != widget.selectedDate) {
      setState(() {
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(picked!);
        }
        widget.selectedDate = picked;

        final formattedDate =
            DateFormat('dd MMMM yyyy', 'tr_TR').format(picked!);

        widget.textEditingController!.text = formattedDate;
        validText = DateFormat('dd/MM/yyyy').format(picked);
      });
    } else {
      validText = widget.textEditingController?.text;
    }
    onChangedFuction(validText);
  }
}

// //!Date Picker Control

String? datePickerControl({
  required BuildContext context,
  required InputDateValidateEnum type,
  String? val,
}) {
  String? validate;
  if (val == null) {
    validate = ' AppLocalizations.of(context)!.needSpecifyDate';
    // ignore: unnecessary_null_comparison
  } else if (val != null) {
    final dateParts = val.split('/'); // Tarihi / işaretine göre böler
    if (dateParts.length == 3) {
      final day = int.tryParse(dateParts[0]) ?? 0;
      final month = int.tryParse(dateParts[1]) ?? 0;
      final year = int.tryParse(dateParts[2]) ?? 0;

      final selectedDate = DateTime(year, month, day);
      final eighteenYearsAgo =
          DateTime.now().subtract(const Duration(days: 567993600));

      if (selectedDate.isAfter(eighteenYearsAgo)) {
        validate = LocaleKeys.datePickerYouMust18.tr();
      }
    }
  } else {
    validate = null;
  }
  return validate;
}
