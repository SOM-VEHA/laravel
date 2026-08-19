import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app/features/profile/StatsModel.dart';
class StatPill extends StatelessWidget {
  const StatPill({required this.item});
  final StatsModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            item.value,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18,color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(item.label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}