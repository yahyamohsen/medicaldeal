import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/check%20out/presentation/manger/cubit/validate_promo_code_cubit.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/total_and_discount.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'custom_check_out_card.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({Key? key}) : super(key: key);

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  String? promoCode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: CustomCheckoutCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Promocode',
              style: Styles.bodyText2.copyWith(
                color: kBLACK,
                fontSize: 14,
              ),
            ),
            const SpaceBox(
              height: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: PromoTextField(
                    onChanged: (value) {
                      promoCode = value;
                    },
                    onSubmitted: (value) {
                      BlocProvider.of<ValidatePromoCodeCubit>(context)
                          .validatePromoCode(value);
                    },
                  ),
                ),
                const SpaceBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<ValidatePromoCodeCubit>(context)
                        .validatePromoCode(promoCode!);
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xff2ACE90),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SpaceBox(
              height: .5,
            ),
            Text(
              ' Hurry! You Got A Discount!',
              style: Styles.bodyText1.copyWith(
                color: const Color(0xff2ACE90),
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoTextField extends StatelessWidget {
  const PromoTextField({Key? key, this.onSubmitted, this.onChanged})
      : super(key: key);

  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      cursorColor: kSecondaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        fillColor: const Color(0xffF0F0F0),
        filled: true,
        border: buildBoder(),
        disabledBorder: buildBoder(),
        enabledBorder: buildBoder(),
        focusedBorder: buildBoder(),
      ),
    );
  }

  OutlineInputBorder buildBoder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Color(0xffF0F0F0),
      ),
    );
  }
}
