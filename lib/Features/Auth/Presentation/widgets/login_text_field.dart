import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/login_cubit/login_cubit.dart';
import 'package:sart_up_project/core/mixins/validation_mixins.dart';
import 'package:sart_up_project/core/widgets/bloc_builder_button.dart';
import 'package:sart_up_project/core/widgets/build_auth_header.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_general_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/space_box.dart';
import '../../../../../../styles.dart';
import '../../../../generated/l10n.dart';
import '../views/forget_password_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(
      {Key? key,
      required this.emailUpperText,
      required this.emailLabel,
      required this.passwordUpperText})
      : super(key: key);
  final String emailUpperText;
  final String passwordUpperText;
  final String emailLabel;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String? phone, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.emailUpperText),
          SpaceBox(height: SizeConfig.screenHeight * 0.001),
          CustomTextFormField(
            validator: (value) {
              if (isFieldEmpty(value)) {
                return S.current.field_is_required;
              } else if (value!.length != 11) {
                return S.current.phone_number_validatioin_error;
              }
              return null;
            },
            onSaved: (value) {
              phone = value;
            },
            title: widget.emailLabel,
            inputType: TextInputType.emailAddress,
          ),
          SpaceBox(height: SizeConfig.screenHeight * 0.003),
          Text(widget.passwordUpperText),
          SpaceBox(height: SizeConfig.screenHeight * 0.001),
          CustomTextFormField(
            onSaved: (value) {
              password = value;
            },
            obsecureText: true,
            title: widget.passwordUpperText,
            inputType: TextInputType.emailAddress,
          ),
          const SpaceBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                onPressed: () => Get.to(
                  const ForgetPasswordView(),
                  transition: Transition.fade,
                ),
                child: Text(
                  S.of(context).forget_password_text,
                  style: Styles.bodyText1.copyWith(
                    color: kSecondaryColor,
                  ),
                ),
              )
            ],
          ),
          SpaceBox(height: SizeConfig.screenHeight * 0.003),
          CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  loginUser();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: S.of(context).log_in,
              gradient: kLinearGradient,
              child: LoginButtonChildBlocBuilder<LoginCubit, LoginState>(
                text: S.of(context).log_in,
              ))
        ],
      ),
    );
  }

  void loginUser() {
    bloc.BlocProvider.of<LoginCubit>(context).login(
      password: password!,
      phone: phone!,
    );
  }
}
