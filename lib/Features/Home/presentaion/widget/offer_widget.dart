import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Home/manger/offers_cubit/offers_cubit.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/custom_error_widget.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'offer_item.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).get_offers_now,
            style: Styles.bodyText2.copyWith(
              color: kBLACK,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const OffersGridView(),
          const SpaceBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}

class OffersGridView extends StatelessWidget {
  const OffersGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersSuccess) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: state.offers.length,
                itemBuilder: (context, index) {
                  return OfferItem(
                    offer: state.offers[index],
                  );
                }),
          );
        } else if (state is OffersFailure) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
