import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/styles.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? child;
  final Widget? leadingWidget;
  final String title;
  const CustomProfileAppBar(
      {super.key,
      required this.child,
      this.leadingWidget,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: leadingWidget ??
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: Styles.bodyText3.copyWith(
          fontSize: 20,
        ),
      ),
      actions: [
        Center(
          child: child,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
