import 'package:flutter/material.dart';
import 'package:lecture_app/core/utils/app_strings.dart';

class SettingsTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const SettingsTile({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: color,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 30),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: AppStrings.primaryFont,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Container(
            child: const Icon(
                Icons.keyboard_arrow_right_sharp,
                color: Color(0xFF006782),
            ),
          )
        ],
      ),
    );
  }
}