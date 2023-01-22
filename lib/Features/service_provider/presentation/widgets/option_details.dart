import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/functions/launch_whatsapp.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../core/utils/functions/determine_transtion.dart';
import '../../../../core/utils/size_config.dart';
import '../cubits/branches_cubit/branches_cubit.dart';
import '../view/our_branches_view.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key, required this.serviceProviderModel})
      : super(key: key);

  final ServiceProviderModel serviceProviderModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ContainerDetails(
          url: '',
          onTap: () {
            print(serviceProviderModel.id);
            BlocProvider.of<BranchesCubit>(context)
                .getBranches(id: serviceProviderModel.id!);
            Get.to(() => const OurBranchesView(),
                transition: determinTranstion());
          },
          text: S.of(context).location,
          color: Colors.orange,
          image: Assets.location_details,
        ),
        Visibility(
          visible: serviceProviderModel.website == null ? false : true,
          child: const SpaceBox(
            width: 3,
          ),
        ),
        ContainerDetails(
          url: serviceProviderModel.website,
          onTap: () {
            launchCustomUrl(context, serviceProviderModel.website!);
          },
          text: S.of(context).website,
          color: Colors.blueAccent,
          image: Assets.earth_details,
        ),
        Visibility(
          visible: serviceProviderModel.phone == null ? false : true,
          child: const SpaceBox(
            width: 3,
          ),
        ),
        ContainerDetails(
          url: serviceProviderModel.phone,
          onTap: () {
            launchWhatsapp(context, number: serviceProviderModel.phone!);
          },
          text: S.of(context).call,
          color: Colors.greenAccent,
          image: Assets.phone_details,
        ),
      ],
    );
  }
}

class ContainerDetails extends StatelessWidget {
  const ContainerDetails(
      {Key? key,
      required this.color,
      required this.image,
      required this.text,
      required this.onTap,
      this.url})
      : super(key: key);
  final Color color;
  final String image;
  final String text;
  final VoidCallback onTap;
  final String? url;
  @override
  Widget build(BuildContext context) {
    return url != null
        ? Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                height: SizeConfig.defaultSize * 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: color.withOpacity(.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset(
                        image,
                        color: color,
                      ),
                    ),
                    const SpaceBox(
                      height: 1,
                    ),
                    Text(
                      text,
                      style: Styles.bodyText1.copyWith(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
