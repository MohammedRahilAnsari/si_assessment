import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool highlight;
  final IconData? icon;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomRowWidget({
    super.key,
    required this.title,
    required this.value,
    this.mainAxisAlignment,
    this.highlight = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final highlightColor = isDarkMode ? Colors.blueAccent : Colors.deepPurpleAccent;

    return value != "0"
        ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ??MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: textColor.withOpacity(0.7)),
            const SizedBox(width: 8),
          ],
          Text(
            "$title: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: highlight ? 16 : 14,
              color: textColor.withOpacity(0.7),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: highlight ? 16 : 14,
              fontWeight: highlight ? FontWeight.normal : FontWeight.bold,
              color: highlight ? highlightColor : textColor,
            ),
          ),
        ],
      ),
    )
        : const SizedBox.shrink();
  }
}