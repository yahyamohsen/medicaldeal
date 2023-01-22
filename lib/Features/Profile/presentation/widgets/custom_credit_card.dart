import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../styles.dart';

class CustomCreditCard extends StatefulWidget {
  CustomCreditCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          onCreditCardWidgetChange: (value) {},
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardBgColor: kPrimaryColor,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView:
              isCvvFocused, //true when you want to show cvv(back) view
        ),
        Expanded(
          child: SingleChildScrollView(
            child: CreditCardForm(
              formKey: formKey,
              obscureCvv: true,
              obscureNumber: true,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              themeColor: kPrimaryColor,
              textColor: Colors.black,
              cardNumberDecoration: buildInputDecoration(
                labelText: S.of(context).number,
                hinText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDateDecoration: buildInputDecoration(
                  labelText: S.of(context).expired_date, hinText: 'XX/XX'),
              cvvCodeDecoration:
                  buildInputDecoration(labelText: 'CVV', hinText: 'XXX'),
              cardHolderDecoration: buildInputDecoration(
                labelText: S.of(context).card_holder,
                hinText: '',
              ),
              onCreditCardModelChange: onCreditCardModelChange,
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(
      {required String labelText, required String hinText}) {
    return InputDecoration(
        filled: true,
        fillColor: const Color(0xffF0F0F0),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        disabledBorder: buildBorder(),
        labelText: labelText,
        hintText: hinText,
        hintStyle: Styles.bodyText1.copyWith(
          color: Colors.grey.withOpacity(.7),
        ),
        labelStyle: Styles.bodyText1.copyWith(
          color: Colors.grey.withOpacity(1),
        ));
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color(0xffF0F0F0),
        ),
        borderRadius: BorderRadius.circular(
          12,
        ));
  }
}
