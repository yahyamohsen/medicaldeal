import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/google_map/presentation/views/near_places_view.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_cubit/service_provider_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/view/service_provider_view.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../../../../core/utils/Assets.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import '../../../splash_view/presentaion/widgets/custom_top_curves.dart';
import 'custom_app_bar.dart';
import '../../../../core/widgets/custom_search_text_field.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * .3,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(SizeConfig.screenWidth, SizeConfig.defaultSize * 20),
              painter: RightCurvePainter(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(SizeConfig.screenWidth, SizeConfig.defaultSize * 17),
              painter: LeftCurvePainter(),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: SizeConfig.defaultSize * 5.3 / 2 + 18,
            child: Image.asset(
              Assets.whiteLogo,
              height: SizeConfig.defaultSize * 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomAppBar(),
                SpaceBox(
                  height: 1.5,
                ),
              ],
            ),
          ),
          Positioned(
            // this value is the same as the content padding of the text field
            bottom: -(SizeConfig.defaultSize * 5.3 / 2) - 5,
            left: 16,
            right: 16,
            child: const CustomHomeSearchTextFieldContainer(),
          ),
        ],
      ),
    );
  }

  String? getUserName() {
    return UserModel.fromJson(Prefs.getObject(kUserModel)).name;
  }
}

class CustomHomeSearchTextFieldContainer extends StatelessWidget {
  const CustomHomeSearchTextFieldContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFD6D6D6),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ServiceProviderCubit>(context)
                    .getServiceProviders();
                Get.to(
                  () => const ServiceProviderView(),
                );
              },
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xff2E2E2E),
                      ),
                    ),
                    Text(
                      S.of(context).search_for_nearest_medical_service,
                      style: Styles.bodyText1.copyWith(
                        color: Colors.grey.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const CustomContainerIcon(),
        ],
      ),
    );
  }
}
