import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:forms360_uikit/src/widgets/inputs/phone_input/flutter_libphonenumber_custom.dart';

class PhoneInput extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(CountryCode)? onCountryCodeChanged;
  final String? Function(String?, CountryWithPhoneCode)? validator;
  final bool isSuffixIconEnabled;
  final Icon? suffixeIcon;
  final Widget? prefixWidget;
  final Function()? suffixIconOnPressed;
  final double? width;
  final bool isEnabled;
  final int? maxLength;
  final double? height;
  final String? initialValue;

  const PhoneInput({
    super.key,
    required this.label,
    required this.hintText,
    required this.onCountryCodeChanged,
    this.controller,
    this.onChanged,
    this.validator,
    this.isSuffixIconEnabled = false,
    this.suffixeIcon,
    this.suffixIconOnPressed,
    this.width,
    this.isEnabled = true,
    this.maxLength,
    this.height,
    this.prefixWidget,
    this.initialValue,
  });

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  CountryWithPhoneCode? currentCountryCode;
  List<CountryWithPhoneCode> countryCodes = [];

  @override
  void initState() {
    super.initState();
    init();
    countryCodes = CountryManager().countries;
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      currentCountryCode = countryCodes.firstWhere(
        (element) => element.countryCode == widget.initialValue,
        orElse: () => CountryWithPhoneCode.gb(),
      );
    } else {
      currentCountryCode = countryCodes.firstWhere(
        (element) =>
            element.countryCode ==
            PlatformDispatcher.instance.locale.countryCode,
        orElse: () => CountryWithPhoneCode.gb(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: FormsKit.widget.inputs.primary(
        prefixWidget: _buildCountryPicker(context),
        label: widget.label,
        hintText: widget.hintText,
        isSuffixIconEnabled: widget.isSuffixIconEnabled,
        suffixIcon: widget.suffixeIcon,
        onIconPressed: widget.suffixIconOnPressed,
        controller: widget.controller,
        inputColor: PrimaryInputColorKit.BLUE,
        contentPadding:
            EdgeInsets.only(top: 18, bottom: 22, left: 19.21, right: 19.21),
        onChanged: widget.onChanged,
        validator: (value) {
          if (widget.validator != null && currentCountryCode != null) {
            return widget.validator!(value, currentCountryCode!);
          }
          return null;
        },
        fontSize: 20,
        enabled: widget.isEnabled,
        maxLength: widget.maxLength,
        inputFormatters: currentCountryCode != null
            ? [
                LibPhonenumberTextFormatter(
                  country: currentCountryCode!,
                ),
              ]
            : null,
      ),
    );
  }

  CountryCodePicker _buildCountryPicker(BuildContext context) {
    return CountryCodePicker(
      onChanged: (countryCode) {
        widget.onCountryCodeChanged?.call(countryCode);
        setState(() {
          currentCountryCode = countryCodes.firstWhere(
            (element) => element.countryCode == countryCode.code,
            orElse: () => CountryWithPhoneCode.gb(),
          );
        });
      },
      initialSelection: currentCountryCode?.countryCode,
      showFlag: true,
      pickerStyle: PickerStyle.dialog,
      dialogSize: const Size(300, 400),
      builder: (country) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                country!.flagUri!,
                package: 'country_code_picker',
                width: 20,
              ),
              Text(
                country.dialCode ?? '',
                style: context.primaryText
                    .copyWith(fontSize: 19, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      },
    );
  }
}
