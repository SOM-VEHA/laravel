import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({required this.name, required this.email, this.onEdit});
  final String name;
  final String email;
  final VoidCallback? onEdit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color:  Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEDEDED),
            ),
            child: const Icon(Icons.person, size: 32, color: Colors.black54),
          ),
          const SizedBox(width: 12),
          // Name & email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 2),
                Text(email, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          // Edit
          IconButton(
            tooltip: 'Edit profile',
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}