import 'package:flutter/material.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.hint,
  });

  final T selectedValue;
  final List<T> items;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.cardColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: selectedValue,
          isExpanded: true,
          dropdownColor: theme.cardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          elevation: 6,
          hint: hint != null
              ? Text(
            hint!,
            style: TextStyle(
              color: theme.hintColor,
              fontSize: 16,
            ),
          )
              : null,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: isDarkMode ? Colors.white70 : Colors.black87,
            size: 28,
          ),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  itemLabel(item),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}