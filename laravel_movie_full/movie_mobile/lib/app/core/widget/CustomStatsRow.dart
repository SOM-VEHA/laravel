import 'package:flutter/cupertino.dart';
import '../app/features/profile/StatsModel.dart';
import 'StatPill.dart';
class CustomStatsRow extends StatelessWidget {
  const CustomStatsRow({required this.items});
  final List<StatsModel> items;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          Expanded(child: StatPill(item: items[i])),
          if (i != items.length - 1) const SizedBox(width: 10),
        ],
      ],
    );
  }
}