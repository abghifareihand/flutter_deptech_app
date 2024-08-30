import 'package:flutter/material.dart';

class ReminderOptions extends StatelessWidget {
  final ValueNotifier<String?> controller;

  const ReminderOptions({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: controller,
      builder: (context, selected, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category label
            const Text(
              'Reminder Options',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8.0),

            Row(
              children: [
                _buildCategoryOption(
                  context: context,
                  category: '1 day before',
                  displayText: '1 day before',
                  selectedCategory: selected,
                  onTap: () => controller.value = '1 day before',
                  color: Colors.blue,
                ),
                const SizedBox(width: 12.0),
                _buildCategoryOption(
                  context: context,
                  category: '3 hours before',
                  displayText: '3 hours before',
                  selectedCategory: selected,
                  onTap: () => controller.value = '3 hours before',
                  color: Colors.orange,
                ),
                const SizedBox(width: 12.0),
                _buildCategoryOption(
                  context: context,
                  category: '1 hour before',
                  displayText: '1 hour before',
                  selectedCategory: selected,
                  onTap: () => controller.value = '1 hour before',
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        );
      },
    );
  }

  Widget _buildCategoryOption({
    required BuildContext context,
    required String category,
    required String displayText,
    required String? selectedCategory,
    required VoidCallback onTap,
    required Color color,
  }) {
    final isSelected = selectedCategory == category;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? color : Colors.grey.withOpacity(0.1), // Gray for non-selected
        ),
        child: Text(
          displayText, // Display the formatted text (e.g., "1 day before")
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : Colors.black, // White text for selected
          ),
        ),
      ),
    );
  }
}
