import 'package:flutter/material.dart';

class SliverFixedExtentlistTab extends StatelessWidget {
  const SliverFixedExtentlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(pinned: true, title: Text("Fixed Extent  (alto fijo)")),
        SliverFixedExtentList(
          // itemextext : alto exacto de cada item -> optimiza el layout
          itemExtent: 120,
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              alignment: Alignment.center,
              // Ya no es necesario colocar la altura, la pone el sliver
              color: index.isEven ? Colors.indigo : Colors.teal,
              child: ListTile(
                leading: Icon(Icons.height),
                title: Text("Fila de altura fija $index"),
                subtitle: Text("Rinde mejor que sliverlist en este caso "),
              ),
            );
          }, childCount: 60),
        ),
      ],
    );
  }
}
