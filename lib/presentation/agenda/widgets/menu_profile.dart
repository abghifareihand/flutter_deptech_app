import 'package:flutter/material.dart';

class MenuProfile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const MenuProfile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 16.0,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey.shade200,
        ),
      ],
    );
  }
}
