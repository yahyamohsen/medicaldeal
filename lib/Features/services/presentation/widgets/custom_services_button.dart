import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_counter.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';
import '../../../../core/widgets/custom_general_button.dart';
import '../manger/cubit/selected_services_cubit.dart';

class CustomServicesViewButton extends StatelessWidget {
  const CustomServicesViewButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedServicesCubit, SelectedServicesState>(
      builder: (context, state) {
        var selectedService = state is SelectedServicesChange
            ? state.numberOfSelectedServices
            : 0;
        return CustomButton(
          onTap: onTap,
          text: S.of(context).continues,
          gradient: kLinearGradient,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpaceBox(),
              Text(
                S.of(context).continues,
                style: Styles.buttonText,
              ),
              AnimatedCrossFade(
                crossFadeState: selectedService == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 250),
                firstChild: const SizedBox(),
                secondChild: ServicesCounter(
                  color: Colors.white,
                  selectedService: selectedService,
                ),
              ),
              const SpaceBox(),
            ],
          ),
        );
      },
    );
  }
}
