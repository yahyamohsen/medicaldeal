import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/size_config.dart';

class CustomPinTextField extends StatelessWidget {
  final Function(String) onChanged;
  final void Function(String) onSubmitted;

  final void Function(String?)? onSaved;

  const CustomPinTextField(
      {Key? key,
      required this.onChanged,
      required this.onSubmitted,
      required this.onSaved})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        onSaved: onSaved,
        onSubmitted: onSubmitted,
        beforeTextPaste: (text) => true,
        enablePinAutofill: false,
        enableActiveFill: false,
        keyboardType: TextInputType.number,
        cursorColor: kPrimaryColor,
        animationType: AnimationType.fade,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Colors.black,
        ),
        pinTheme: PinTheme(
          activeColor: const Color(0xFFE4E8Ec),
          selectedColor: kPrimaryColor,
          inactiveColor: const Color(0xFFE4E8Ec),
          shape: PinCodeFieldShape.box,
          fieldHeight: SizeConfig.defaultSize * 6.5,
          fieldWidth: SizeConfig.defaultSize * 6.3,
          borderRadius: BorderRadius.circular(10),
        ),
        appContext: context,
        length: 4,
        onChanged: onChanged,
        validator: (String? value) {
          if (value!.length < 4) {
            return 'برجاء ادخال الكود كامل';
          }
          try {
            int.parse(value);
            return null;
          } on Exception catch (e) {
            return 'Error';
          }
        },
      ),
    );
  }
}
