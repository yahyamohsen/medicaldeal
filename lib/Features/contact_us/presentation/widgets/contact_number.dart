import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sart_up_project/core/utils/size_config.dart';

import '../../../../generated/l10n.dart';

class ContactPhoneNumber extends StatefulWidget {
  ContactPhoneNumber({Key? key}) : super(key: key);

  @override
  State<ContactPhoneNumber> createState() => _ContactPhoneNumberState();
}

class _ContactPhoneNumberState extends State<ContactPhoneNumber> {
  String selectedItem = "+20";

  final List<String> numberList = <String>['+10', '+30', '+40'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: SizeConfig.defaultSize * 10,
          height: SizeConfig.defaultSize * 7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromRGBO(240, 240, 240, .9)),
          child: Center(
              child: DropdownButtonFormField(
            decoration: InputDecoration.collapsed(hintText: ''),
            dropdownColor: Colors.grey,
            value: selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
            items: <String>["+20", "+30", "+40", "+50"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
          )),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: SizeConfig.defaultSize * 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color.fromRGBO(240, 240, 240, 1)),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                  hintText: ' S.of(context).enter_your_mobile_number',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
        ),
      ],
    );
  }
}
