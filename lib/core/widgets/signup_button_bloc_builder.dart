import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/register_cubit/register_cubit_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../styles.dart';
import 'custom_loading_indicator.dart';

class SignupButtonChildBlocBuilder extends StatelessWidget {
  const SignupButtonChildBlocBuilder({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubitCubit, RegisterCubitState>(
      builder: (context, state) {
        return AnimatedCrossFade(
          duration: kDurationTransion,
          crossFadeState: state is Loading
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          secondChild: const CustomLoadingIndicator(
            color: Colors.white,
          ),
          firstChild: Center(
            child: Text(
              text,
              style:
                  Styles.buttonText.copyWith(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.right,
            ),
          ),
        );
      },
    );
  }
}
