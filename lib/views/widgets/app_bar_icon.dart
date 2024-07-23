import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  const AppBarIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
      ),
    );
  }
}
