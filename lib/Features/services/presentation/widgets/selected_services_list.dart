import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/selected_service_item.dart';

import '../manger/cubit/selected_services_cubit.dart';

class SelectedServicesList extends StatelessWidget {
  const SelectedServicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedServicesCubit, SelectedServicesState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: BlocProvider.of<SelectedServicesCubit>(context)
                  .selectedServices
                  .length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SelectedServiceItem(
                      itemIndex: index,
                      selectedServiceModel:
                          BlocProvider.of<SelectedServicesCubit>(context)
                              .selectedServices[index]),
                );
              }),
        );
      },
    );
  }
}
