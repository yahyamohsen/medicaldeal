import 'package:flutter/material.dart';

class CustomScrollableForm extends StatelessWidget {
  const CustomScrollableForm({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
