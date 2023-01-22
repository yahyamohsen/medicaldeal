import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/service_provider/models/review_model.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/add_review_vubit/add_review_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/reviews_cubit/reviews_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/option_details.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/social_icons.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/rating_bar.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/review_description.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_list_view_item.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/text_description.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/text_field.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/core/widgets/success_bar.dart';
import 'package:sart_up_project/generated/l10n.dart';

import 'add_review_bottom_sheet.dart';
import 'container_option_details.dart';

class ServiceProviderDetailsViewBody extends StatelessWidget {
  const ServiceProviderDetailsViewBody(
      {Key? key, required this.serviceProvider})
      : super(key: key);

  final ServiceProviderModel serviceProvider;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Stack(
                children: [
                  CustomCachedImage(
                      imageUrl: serviceProvider.image,
                      width: double.infinity,
                      height: SizeConfig.defaultSize * 25),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.defaultSize * 25 - 16,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.defaultSize * 2,
                    ),
                    RatingBarWidget(
                        rating: double.parse(serviceProvider.rating!),
                        text: getLocalizedData(
                          serviceProvider.titleEn,
                          serviceProvider.title,
                        )),
                    const SpaceBox(
                      height: 2.5,
                    ),
                    ContactInfo(
                      serviceProviderModel: serviceProvider,
                    ),
                    const SpaceBox(
                      height: 1.5,
                    ),
                    CustomServiceDetailsButton(
                      serviceProviderModel: serviceProvider,
                    ),
                    const SpaceBox(
                      height: 2.5,
                    ),
                    ServiceTypeInfo(
                      title: S.of(context).service_type,
                      description: getLocalizedData(
                        serviceProvider.descriptionEn,
                        serviceProvider.description,
                      ),
                    ),
                    const SpaceBox(
                      height: 2.5,
                    ),
                    const ReviewsWidget(),
                    GestureDetector(
                      onTap: () {
                        showAddreviewBottomSheet(
                          context,
                          serviceProvider.id.toString(),
                        );
                      },
                      child: CustomServiceDetailsTextField(
                          isEnabled: false,
                          text: S.of(context).write_your_view),
                    ),
                    SocaialIcons(
                      serviceProviderModel: serviceProvider,
                    ),
                    const SpaceBox(
                      height: 2.5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void showAddreviewBottomSheet(BuildContext context, String providerId) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        context: context,
        builder: (context) {
          return BlocConsumer<AddReviewCubit, AddReviewState>(
            listener: (context, state) {
              if (state is AddReviewFailure) {
                errorBar(context, message: state.errMessage);
              }

              if (state is AddReviewNetworkFailure) {
                errorBar(context, message: S.current.no_internet_connection);
              }

              if (state is AddReviewSuccess) {
                BlocProvider.of<ReviewsCubit>(context).getReviews(
                  id: providerId,
                );

                sucessBar(
                  context,
                  message: S.current.review_added_successfully,
                );
                Get.back();
              }
            },
            builder: (context, state) => AbsorbPointer(
              absorbing: state is AddReviewLoading ? true : false,
              child: AddReviewBottomSheet(
                serviceProviderModel: serviceProvider,
              ),
            ),
          );
        });
  }
}
