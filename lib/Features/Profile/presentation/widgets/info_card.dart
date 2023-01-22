import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.child, required this.onPresse})
      : super(key: key);
  final VoidCallback onPresse;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(.10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child,
          IconButton(
              onPressed: onPresse,
              icon: const Icon(
                Icons.arrow_forward_ios,
              ))
        ],
      ),
    );
  }
}
