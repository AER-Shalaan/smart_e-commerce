import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final int value;
  final bool isBold;
  final bool isBlack;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isBlack = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.dmSans(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
                color: isBlack ? Colors.black : Colors.grey,
              )),
          Text('\$ $value',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
