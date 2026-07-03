import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class InfoBook extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;

  const InfoBook({super.key, required this.icon, required this.label, required this.color});

  @override
  State<InfoBook> createState() => InfoBookState();
}

class InfoBookState extends State<InfoBook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 24,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(widget.icon, size: 16, color: AppColors.black),
          const SizedBox(width: 3),
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
