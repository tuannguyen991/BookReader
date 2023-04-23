import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class ModalItem extends StatelessWidget {
  const ModalItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isUserTab = false,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isUserTab;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: double8),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.secondaryColor,
              ),
              horizontalSpace16,
              Text(
                title,
                style: const TextStyle(fontSize: fontSize16),
              ),
              if (isUserTab) ...[
                const Spacer(),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.secondaryColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
