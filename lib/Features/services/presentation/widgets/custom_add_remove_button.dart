import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';

import '../../../../constants.dart';

class CustomAddRemoveButtom extends StatelessWidget {
  final bool isLeft;
  const CustomAddRemoveButtom(
      {Key? key, this.isLeft = true, required this.onTap})
      : super(key: key);

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: isLeft
              ? const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
        ),
        child: Center(
          child: Icon(
            isLeft ? Icons.remove : Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
