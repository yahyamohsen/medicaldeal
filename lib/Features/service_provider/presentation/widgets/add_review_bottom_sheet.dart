import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/add_review_vubit/add_review_cubit.dart';

import '../../../../constants.dart';
import '../../../../core/singleton/shared_prefrence_singleton.dart';
import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';
import '../../../Auth/models/user_model.dart';
import '../../models/review_model.dart';
import '../../models/service_provider_model.dart';
import 'add_review_rating_bar.dart';

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({super.key, required this.serviceProviderModel});
  final ServiceProviderModel serviceProviderModel;
  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? reviceComment;
  String? rating = '0';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                S.current.add_review,
                style: Styles.bodyText3.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              AddReviewRatingBar(
                onRatingUpdate: (value) {
                  rating = value.toString();
                },
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  reviceComment = value;
                },
                title: S.current.write_your_view,
                maxLength: 5,
              ),
              const SizedBox(
                height: 32,
              ),
              BlocBuilder<AddReviewCubit, AddReviewState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddReviewLoading ? true : false,
                    onTap: () {
                      validateInput();
                    },
                    backGroundColor: kPrimaryColor,
                    text: S.current.add_review,
                  );
                },
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateInput() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      addReview();
    }
  }

  void addReview() {
    var userId = UserModel.fromJson(Prefs.getObject(kUserModel)).id;
    var reviewModel = ReviewModel(
      userId: userId.toString(),
      serviceProviderId: widget.serviceProviderModel.id,
      reviewComment: reviceComment,
      rate: rating,
    );

    BlocProvider.of<AddReviewCubit>(context)
        .addReview(reviewModel: reviewModel);
  }
}
