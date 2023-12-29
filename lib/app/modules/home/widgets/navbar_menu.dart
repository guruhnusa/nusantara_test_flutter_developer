import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class NavMenu extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const NavMenu({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryBlue : null,
          borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(iconPath),
              color: isActive ? Colors.white : Colors.black,
            ),
            if (isActive) const SizedBox(width: 4.0),
            if (isActive)
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
