import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class SerchItem extends StatefulWidget {
  final Map<String, String> book;
  final bool showCloseButton;
  final VoidCallback? onClose;
  final VoidCallback? onTap;

  const SerchItem({
    super.key,
    required this.book,
    this.showCloseButton = false,
    this.onClose,
    this.onTap,
  });

  @override
  State<SerchItem> createState() => _SerchItemState();
}

class _SerchItemState extends State<SerchItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(width: 44, height: 56, color: AppColors.gray4),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book['title'] ?? '',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.book['author'] ?? '',
                    style: const TextStyle(
                      color: AppColors.gray2,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.headphones, size: 12, color: AppColors.gray1),
                      const SizedBox(width: 4),
                      Text(
                        widget.book['listen'] ?? '',
                        style: const TextStyle(
                          color: AppColors.gray2,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.menu_book, size: 12, color: AppColors.gray1),
                      const SizedBox(width: 4),
                      Text(
                        widget.book['read'] ?? '',
                        style: const TextStyle(
                          color: AppColors.gray2,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (widget.showCloseButton)
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.gray2, size: 18),
                onPressed: widget.onClose,
              ),
          ],
        ),
      ),
    );
  }
}
