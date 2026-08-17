import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCellTile extends StatelessWidget {
  const CustomCellTile({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      trailing: trailing ?? const Icon(Icons.chevron_right_rounded,color: Colors.white,),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      visualDensity: VisualDensity.compact,
    );
  }
}