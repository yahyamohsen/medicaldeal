import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/login_cubit/login_cubit.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/register_cubit/register_cubit_cubit.dart';
import 'package:sart_up_project/core/mixins/validation_mixins.dart';
import 'package:sart_up_project/core/widgets/bloc_builder_button.dart';
import 'package:sart_up_project/core/widgets/build_auth_header.dart';
import 'package:sart_up_project/core/widgets/signup_button_bloc_builder.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_general_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/space_box.dart';
import '../../../../../../styles.dart';
import '../../../../generated/l10n.dart';
import '../views/forget_password_view.dart';

class SignupForm extends StatefulWidget {
  const SignupForm(
      {Key? key,
      required this.emailUpperText,
      required this.emailLabel,
      required this.passwordUpperText})
      : super(key: key);
  final String emailUpperText;
  final String passwordUpperText;
  final String emailLabel;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String? phone, password, name;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).your_email_or_mobile_phone),
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
            inputType: TextInputType.number,
          ),
          SpaceBox(height: SizeConfig.screenHeight * 0.003),
          Text(S.of(context).name),
          SpaceBox(height: SizeConfig.screenHeight * 0.001),
          CustomTextFormField(
            onSaved: (value) {
              name = value;
            },
            title: widget.emailLabel,
            inputType: TextInputType.text,
          ),
          SpaceBox(height: SizeConfig.screenHeight * 0.003),
          Text(widget.passwordUpperText),
          SpaceBox(height: SizeConfig.screenHeight * 0.001),
          CustomTextFormField(
            validator: (value) {
              if (isFieldEmpty(value)) {
                return S.current.field_is_required;
              } else if (value!.length < 6) {
                return S.current.password_validation_error;
              }
              return null;
            },
            onSaved: (value) {
              password = value;
            },
            obsecureText: true,
            title: widget.passwordUpperText,
            inputType: TextInputType.visiblePassword,
          ),
          const SpaceBox(
            height: 1,
          ),
          SpaceBox(height: SizeConfig.screenHeight * 0.003),
          CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  registerUser();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: S.of(context).sign_up,
              gradient: kLinearGradient,
              child: SignupButtonChildBlocBuilder(
                text: S.of(context).sign_up,
              ))
        ],
      ),
    );
  }

  void registerUser() {
    bloc.BlocProvider.of<RegisterCubitCubit>(context).registerUser(
      password: password!,
      phone: phone!,
      userName: name!,
    );
  }
}
