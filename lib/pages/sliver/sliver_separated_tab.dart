import 'package:flutter/material.dart';

// emular un listvieew.builder
// No existe sliver.separated

class SliverSeparatedTab extends StatelessWidget {
  const SliverSeparatedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (i) => "item $i");
    return CustomScrollView(
      slivers: [
        SliverAppBar(pinned: true, title: Text("Separated emulado")),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            // indices pares -> item; impares->separador
            if (index.isOdd) {
              return Divider();
            }
            final realIndex = index ~/ 2; //división truncada entre 2

            return ListTile(
              leading: Icon(Icons.label_outline),
              title: Text(items[realIndex]),
            );
          }, childCount: items.length * 2 - 1),
        ),
      ],
    );
  }
}
