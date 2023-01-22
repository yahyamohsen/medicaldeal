import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../styles.dart';
import '../../models/selected_service_model.dart';
import '../manger/cubit/selected_services_cubit.dart';

class SelectedServiceCountBlocBuilder extends StatelessWidget {
  const SelectedServiceCountBlocBuilder({
    Key? key,
    required this.selectedServiceModel,
  }) : super(key: key);

  final SelectedServiceModel selectedServiceModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedServicesCubit, SelectedServicesState>(
      builder: (context, state) {
        return Text(
          selectedServiceModel.count.toString(),
          style: Styles.bodyText1.copyWith(color: const Color(0xff3A3A3A)),
        );
      },
    );
  }
}
