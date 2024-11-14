import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  CustomErrorDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )
        ],
      ),
      content: Text(
        message,
        style: GoogleFonts.lato(
          fontSize: 16,
          color: Colors.grey[800],
        ),
      ),
      actions: [
        if (onRetry != null)
          TextButton(
            onPressed: onRetry,
            child: Text(
              'Retry',
              style: GoogleFonts.lato(color: Colors.blueAccent, fontSize: 16),
            ),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Close',
            style: GoogleFonts.lato(color: Colors.blueAccent, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
