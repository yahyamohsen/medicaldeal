import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

class ExpiryAndCvv_Info extends StatelessWidget {
  const ExpiryAndCvv_Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SpaceBox(
            height: 3,
          ),
          Row(
            children: [
              Container(
                width: 100,
                child: Text(S.of(context).expired_date),
              ),
              SpaceBox(
                width: 11,
              ),
              Container(
                width: 100,
                child: Text('CVV'),
              ),
            ],
          ),
          SpaceBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 170,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: ' / ',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xFFD6D6D6),
                        )),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFD6D6D6),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFD6D6D6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFD6D6D6),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 170,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '- - -',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xFFD6D6D6),
                        )),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFD6D6D6),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFD6D6D6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFD6D6D6),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
