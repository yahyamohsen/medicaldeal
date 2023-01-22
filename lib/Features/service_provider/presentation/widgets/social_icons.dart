import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/view/service_provider_details.dart';
import 'package:sart_up_project/core/utils/functions/launch_whatsapp.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';

class SocaialIcons extends StatelessWidget {
  const SocaialIcons({Key? key, required this.serviceProviderModel})
      : super(key: key);

  final ServiceProviderModel serviceProviderModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: serviceProviderModel.facbook == null ? false : true,
          child: Column(
            children: [
              SocialIcon(
                onPressed: () {
                  launchCustomUrl(context, serviceProviderModel.facbook!);
                },
                icon: FontAwesomeIcons.facebook,
                color: const Color(
                  0xff4267B2,
                ),
              ),
              const SpaceBox(
                width: 2,
              ),
            ],
          ),
        ),
        Visibility(
          visible: serviceProviderModel.instgram == null ? false : true,
          child: Column(
            children: [
              SocialIcon(
                onPressed: () {
                  launchCustomUrl(context, serviceProviderModel.instgram!);
                },
                icon: FontAwesomeIcons.instagram,
                color: const Color(
                  0xfffb3958,
                ),
              ),
              const SpaceBox(
                width: 2,
              ),
            ],
          ),
        ),
        Visibility(
          visible: serviceProviderModel.twitter == null ? false : true,
          child: SocialIcon(
            onPressed: () {
              launchCustomUrl(context, serviceProviderModel.twitter!);
            },
            icon: FontAwesomeIcons.twitter,
            color: const Color(
              0xff1DA1F2,
            ),
          ),
        ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key? key,
    required this.icon,
    required this.color,
    this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
        size: SizeConfig.defaultSize * 4,
      ),
    );
  }
}
