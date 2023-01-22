import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/change_phone/change_phone_cubit.dart';
import 'package:sart_up_project/core/widgets/custom_text_field.dart';
import 'package:sart_up_project/generated/l10n.dart';

class ChangePhoneNumberViewBody extends StatelessWidget {
  const ChangePhoneNumberViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var changePhoneCubit = BlocProvider.of<ChangePhoneCubit>(context);
    return Form(
      key: changePhoneCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            title: S.current.current_phone_number,
            inputType: TextInputType.phone,
            onSaved: (value) {
              changePhoneCubit.currentPhone = value!;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            title: S.current.mobile_number,
            inputType: TextInputType.phone,
            onSaved: (value) {
              changePhoneCubit.newPhone = value!;
            },
          ),
        ],
      ),
    );
  }
}
