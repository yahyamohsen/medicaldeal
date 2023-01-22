import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/contact_us/presentation/cubits/cubit/contact_us_cubit.dart';
import 'package:sart_up_project/Features/contact_us/presentation/widgets/uploading_image.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/functions/pick_image.dart';
import 'package:sart_up_project/core/widgets/custom_general_button.dart';
import 'package:sart_up_project/core/widgets/custom_scrollable_form.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';

import '../../../../generated/l10n.dart';
import 'custom_contect_us_text_field.dart';

class ContactUsViewBody extends StatefulWidget {
  const ContactUsViewBody({Key? key}) : super(key: key);

  @override
  State<ContactUsViewBody> createState() => _ContactUsViewBodyState();
}

class _ContactUsViewBodyState extends State<ContactUsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, description;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContactUstextField(
              onSaved: (value) {
                title = value;
              },
              title: S.current.title,
              hintText: S.current.title,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomContactUstextField(
              onSaved: (value) {
                description = value;
              },
              title: S.of(context).description,
              hintText: S.of(context).type_your_description,
              maxLength: 7,
            ),
            const SizedBox(
              height: 16,
            ),
            UploadImage(
              image: image,
              onTap: () async {
                var result = await pickImage();
                result.fold(
                    (l) => errorBar(
                          context,
                          message: S.current.failed_to_pick_image,
                        ),
                    (r) => image = File(
                          r.path,
                        ));

                setState(() {});
              },
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  BlocProvider.of<ContactUsCubit>(context).sendFeedBack(
                    title: title!,
                    description: description!,
                    image: image,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                  setState(() {});
                }
              },
              text: S.of(context).send,
              gradient: kLinearGradient,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
