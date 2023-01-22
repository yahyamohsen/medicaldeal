import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/Profile/presentation/views/change_phone_number_view.dart';
import 'package:sart_up_project/Features/Profile/presentation/views/profile_change_password_view.dart';
import 'package:sart_up_project/Features/Profile/presentation/views/profile_payment_method_view.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/scan_offer_widget.dart';
import 'package:sart_up_project/Features/contact_us/presentation/view/contact_us_view.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_cubit/service_provider_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/view/service_provider_view.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/user_services_cubit.dart';
import 'package:sart_up_project/Features/your_service/presentation/view/your_service_view.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/functions/determine_transtion.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../../../../styles.dart';
import 'basic_info_widget.dart';
import 'custom_profile_info_text.dart';
import 'info_card.dart';
import 'medical_info_widget.dart';
import 'profile_title.dart';
import 'refactor_edit_profile_buttom.dart';
import 'sign_out_widget.dart';
import 'text_title.dart';

class ProfileDetailsInfo extends StatelessWidget {
  const ProfileDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel.fromJson(Prefs.getObject(kUserModel));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfileTitle(
              name: user.name!,
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomEditProfileButton(),
            const SpaceBox(height: 1),
            TextTitle(
              title: S.of(context).basic_info,
            ),
            const SizedBox(
              height: 16,
            ),
            BasicInfo(
              user: user,
            ),
            const SizedBox(
              height: 22,
            ),
            InfoCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomProfileInfoText(text: S.of(context).change_password),
                  const SpaceBox(
                    height: 2,
                  ),
                  CustomProfileInfoText(
                    text: '***********',
                    textColor: Colors.grey.withOpacity(.7),
                  ),
                ],
              ),
              onPresse: () {
                Get.to(
                  () => const ProfileChangePasswordView(),
                  transition: determinTranstion(),
                );
              },
            ),
            const SizedBox(
              height: 22,
            ),
            InfoCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomProfileInfoText(text: S.current.mobile_number),
                  const SpaceBox(
                    height: 2,
                  ),
                  CustomProfileInfoText(
                    text: user.phone!,
                    textColor: Colors.grey.withOpacity(.7),
                  ),
                ],
              ),
              onPresse: () {
                Get.to(
                  () => const ChangePhoneNumberView(),
                  transition: determinTranstion(),
                );
              },
            ),
            const SizedBox(
              height: 22,
            ),
            InfoCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomProfileInfoText(
                    text: S.of(context).payment_method,
                  ),
                  const SpaceBox(
                    height: 2,
                  ),
                  CustomProfileInfoText(
                    text: '**** ***** ** 7815',
                    textColor: Colors.grey.withOpacity(.7),
                  ),
                ],
              ),
              onPresse: () {
                Get.to(() => const ProfilePaymentMethodView(),
                    transition: determinTranstion());
              },
            ),
            const SizedBox(
              height: 22,
            ),
            InfoWidget(
              onPressed: () {
                var user = UserModel.fromJson(Prefs.getObject(kUserModel));
                BlocProvider.of<UserServicesCubit>(context)
                    .fetchUserServices(userId: user.id.toString());
                Get.to(() => const YourServiceView(),
                    transition: determinTranstion());
              },
              title: S.of(context).medical_info,
              subTitle: S.of(context).your_services,
            ),
            const SizedBox(
              height: 22,
            ),
            InfoWidget(
              onPressed: () {
                Get.to(() => const ContactUsView(),
                    transition: determinTranstion());
              },
              title: S.of(context).contact_us,
              subTitle: S.of(context).contact_us_info,
            ),
            const SizedBox(
              height: 22,
            ),
            InfoCard(
                child: CustomProfileInfoText(
                  text: S.of(context).service_privder,
                ),
                onPresse: () {
                  BlocProvider.of<ServiceProviderCubit>(context)
                      .getServiceProviders();
                  Get.to(() => const ServiceProviderView(),
                      transition: determinTranstion());
                }),
            const SizedBox(
              height: 22,
            ),
            const ScanOffer(),
            const SizedBox(
              height: 22,
            ),
            const SignoutWidget(),
            const SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}
