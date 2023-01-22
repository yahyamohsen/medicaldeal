import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key, required this.details});

  final String details;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            details,
            style: GoogleFonts.roboto(
              fontSize: 16,
              letterSpacing: 1.2,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
