import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/manger/cubit/compare_cubit.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';

import 'compare_price_item.dart';

class ComparePriceList extends StatelessWidget {
  const ComparePriceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompareCubit, CompareState>(
      builder: (context, state) {
        if (state is CompareDataUpdated) {
          return ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ComparePriceItem(
                    placeModel: state.placeWithServices.placeModel,
                    service: state.placeWithServices.services[index],
                  ),
                );
              });
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
