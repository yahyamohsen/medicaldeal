import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/your_service/data/models/user_service_model.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/cubit/order_details_cubit.dart';
import 'package:sart_up_project/Features/your_service/presentation/view/oder_details_view.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

import '../../../../constants.dart';
import '../../../../styles.dart';

class UserServiceItem extends StatelessWidget {
  const UserServiceItem({
    Key? key,
    required this.userServiceModel,
    this.canelOrder,
  }) : super(key: key);

  final UserServiceModel userServiceModel;
  final void Function()? canelOrder;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 55,
            child: GestureDetector(
              onTap: () {
                var userId = UserModel.fromJson(Prefs.getObject(kUserModel)).id;

                BlocProvider.of<OrderDetailsCubit>(context).fetchOrderDetails(
                    userId: userId.toString(),
                    orderId: userServiceModel.orderId!);

                Get.to(() => const OrderDetailsView());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(userServiceModel.title!),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            IconButton(
              onPressed: canelOrder,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              DateFormat('dd - MM - yyyy').format(
                userServiceModel.createdAt!,
              ),
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}
