import 'package:flutter/material.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../constants.dart';
import '../../styles.dart';
import '../mixins/validation_mixins.dart';

typedef StringCallBack = String Function(String?);

class CustomTextFormField extends StatelessWidget with ValidationMixin {
  final String? title;
  final Icon? icon;
  final int? maxLength;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final Widget? suffexIcon;
  final Widget? hintText;
  final bool? filled;
  final Color? fillColor;
  final Widget? labelText;
  final ValueSetter<String?>? onSaved;
  final ValueSetter? onChanged;
  final bool? obsecureText;
  final bool enablePaste;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final double? borderRadius;
  const CustomTextFormField({
    Key? key,
    this.title,
    this.icon,
    this.focusNode,
    this.inputType,
    this.suffexIcon,
    this.hintText,
    this.filled,
    this.fillColor,
    this.labelText,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.onTap,
    this.obsecureText = false,
    this.enablePaste = true,
    this.maxLength,
    this.borderRadius,
    this.isEnabled,
  }) : super(key: key);
  final bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      focusNode: focusNode,
      cursorColor: kPrimaryColor,
      onTap: onTap,
      maxLines: maxLength ?? 1,
      enableInteractiveSelection: enablePaste,
      keyboardType: inputType,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            if (isFieldEmpty(value!)) {
              return S.current.field_is_required;
            }
          },
      onSaved: onSaved,
      obscureText: obsecureText ?? false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
        filled: true,
        fillColor: fillColor ?? const Color(0xffF0F0F0),
        suffixIcon: suffexIcon,
        hintText: title,
        hintStyle: Styles.bodyText1.copyWith(
            color: const Color(0xffA1A1A1),
            fontSize: SizeConfig.defaultSize * 1.3,
            fontWeight: FontWeight.w500),
        prefixIcon: icon,
        border: buildBorder(),
        disabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      borderSide: const BorderSide(
        color: Color(0xFFF0F0F0),
      ),
    );
  }
}
