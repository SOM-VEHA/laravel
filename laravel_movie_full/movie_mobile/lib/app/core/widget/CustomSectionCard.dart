import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSectionCard extends StatelessWidget {
  const CustomSectionCard({required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: const Color(0xFFEFEFEF)),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w800,color: Colors.white),
            ),
            dense: true,
          ),
          const Divider(height: 1,color: Colors.grey,),
          ..._withDividers(children),
        ],
      ),
    );
  }

  List<Widget> _withDividers(List<Widget> tiles) {
    final list = <Widget>[];
    for (int i = 0; i < tiles.length; i++) {
      list.add(tiles[i]);
      if (i != tiles.length - 1) {
        list.add(const Divider(height: 1, indent: 16));
      }
    }
    return list;
  }
}

