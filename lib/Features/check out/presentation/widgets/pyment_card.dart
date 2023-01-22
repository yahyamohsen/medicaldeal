import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';

import '../../../../styles.dart';
import 'custom_check_out_card.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: CustomCheckoutCard(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Choose Your Payment Method',
            style: Styles.bodyText2.copyWith(
              color: kBLACK,
              fontSize: 14,
            ),
          ),
          const CustomPaymetnChoices(),
        ],
      )),
    );
  }
}

class CustomPaymetnChoices extends StatefulWidget {
  const CustomPaymetnChoices({Key? key}) : super(key: key);

  @override
  State<CustomPaymetnChoices> createState() => _CustomPaymetnChoicesState();
}

class _CustomPaymetnChoicesState extends State<CustomPaymetnChoices> {
  String selectedValue = 'Pay in Cashe';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: ListTile(
        //     contentPadding: EdgeInsets.zero,
        //     title: Transform.translate(
        //         offset:
        //             isEnglish() ? const Offset(-16, 0) : const Offset(16, 0),
        //         child: Text(
        //           'CreditCard',
        //           style: Styles.bodyText1.copyWith(
        //             color: kBLACK,
        //           ),
        //         )),
        //     leading: CustomRadioButton(
        //       onChange: (value) {
        //         setState(() {
        //           selectedValue = value!;
        //         });
        //       },
        //       value: 'CreditCard',
        //       selectedValue: selectedValue,
        //     ),
        //   ),
        // ),
        Expanded(
          child: ListTile(
            title: Transform.translate(
              offset: isEnglish() ? const Offset(-16, 0) : const Offset(16, 0),
              child: AutoSizeText(
                'Pay in Cashe',
                maxLines: 1,
                style: Styles.bodyText1.copyWith(
                  color: kBLACK,
                ),
              ),
            ),
            leading: CustomRadioButton(
              onChange: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              value: 'Pay in Cashe',
              selectedValue: selectedValue,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.selectedValue,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  final String selectedValue;
  final String value;
  final void Function(String?)? onChange;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Radio<String>(
        activeColor: kSecondaryColor,
        value: value,
        groupValue: selectedValue,
        onChanged: onChange,
      ),
    );
  }
}
