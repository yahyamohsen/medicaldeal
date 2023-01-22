import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/sign_out/sign_out_cubit.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';

class SignoutWidget extends StatelessWidget {
  const SignoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<SignOutCubit>(context).signOut();
          },
          child: Text(
            S.of(context).sign_out,
            style: Styles.bodyText1.copyWith(
              color: Colors.red,
            ),
          ),
        ),
        const Spacer(),
        Text(
          'Version 01',
          style: Styles.bodyText1.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
