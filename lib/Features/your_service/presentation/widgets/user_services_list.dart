import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/delete_order_cubit.dart';
import 'package:sart_up_project/Features/your_service/presentation/widgets/user_service_item.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/user_service_model.dart';

class UserServicesList extends StatefulWidget {
  const UserServicesList({Key? key, required this.userServices})
      : super(key: key);

  final List<UserServiceModel> userServices;

  @override
  State<UserServicesList> createState() => _UserServicesListState();
}

class _UserServicesListState extends State<UserServicesList> {
  late List<UserServiceModel> userServices;

  final GlobalKey<AnimatedListState> key = GlobalKey();

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    userServices = [...widget.userServices];
    super.initState();
  }

  UserServiceModel? currentDeleteOrder;
  int? deletedOrderIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteOrderCubit, DeleteOrderState>(
      listener: (context, state) {
        if (state is DeleteOrderSuccess) {
          sucessBar(context, message: S.current.order_deleted_successfully);
        }

        if (state is DeleteOrderFailure) {
          errorBar(context, message: state.errMessage);
          insertItem();
        }
      },
      child: AnimatedList(
          physics: const BouncingScrollPhysics(),
          key: key,
          controller: scrollController,
          padding: EdgeInsets.zero,
          initialItemCount: userServices.length,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: UserServiceItem(
                      canelOrder: () {
                        if (userServices[index].status != '1') {
                          BlocProvider.of<DeleteOrderCubit>(context)
                              .deleteOrder(
                                  userId: userServices[index].userId!,
                                  orderId: userServices[index].orderId!);
                          deleteItem(index);
                        } else {
                          errorBar(context,
                              message: S.current.order_cannot_be_deleted);
                        }
                      },
                      userServiceModel: widget.userServices[index],
                    ),
                  ),
                  index != userServices.length - 1
                      ? const Opacity(
                          opacity: .3,
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          }),
    );
  }

  void deleteItem(int index) {
    currentDeleteOrder = userServices[index];
    deletedOrderIndex = index;
    userServices.removeAt(deletedOrderIndex!);

    key.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: UserServiceItem(
                canelOrder: () {},
                userServiceModel: currentDeleteOrder!,
              ),
            ),
            const Opacity(
              opacity: .5,
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    });
  }

  // instering the deleted item incase we failed to delete it from the api
  void insertItem() {
    userServices.insert(deletedOrderIndex!, currentDeleteOrder!);
    key.currentState!.insertItem(deletedOrderIndex!);
  }
}
