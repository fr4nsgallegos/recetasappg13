import 'package:flutter/material.dart';

class SliverPersistHeadrTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const sections = [
      {
        "title": "Frutas",
        "items": ["Manza", "Pera", "Durazno", "Fresa"],
      },
      {
        "title": "Verduras",
        "items": [
          "Zahanhora",
          "Lechuga",
          "Tomate",
          "Zahanhora",
          "Lechuga",
          "Tomate"
              "Zahanhora",
          "Lechuga",
          "Tomate"
              "Zahanhora",
          "Lechuga",
          "Tomate"
              "Zahanhora",
          "Lechuga",
          "Tomate"
              "Zahanhora",
          "Lechuga",
          "Tomate"
              "Zahanhora",
          "Lechuga",
          "Tomate",
        ],
      },
      {
        "title": "Granos",
        "items": [
          "Arroz",
          "Quinua",
          "Avena",
          "Trigo",
          "Arroz",
          "Quinua",
          "Avena",
          "Trigo",
          "Arroz",
          "Quinua",
          "Avena",
          "Trigo",
          "Arroz",
          "Quinua",
          "Avena",
          "Trigo",
          "Arroz",
          "Quinua",
          "Avena",
          "Trigo",
          "Arroz",
          "Quinua",
          "Avena",
          "Trigo",
          "Arroz",
          "Quinua",
          "Avena",
          "Trigo",
          "Arroz",
          "Quinua",
          "Avena",
          "Trigo",
        ],
      },
    ];

    final slivers = <Widget>[
      SliverAppBar(
        pinned: true,
        expandedHeight: 120,
        flexibleSpace: FlexibleSpaceBar(title: Text("Heades pegasos")),
      ),
    ];

    // construimos los header -> lista de item para cada seccion
    for (final section in sections) {
      final title = section["title"] as String;
      final items = section["items"] as List<String>;

      slivers.add(
        SliverPersistentHeader(
          pinned: true,
          delegate: _SectionHeaderDelegate(title: title),
        ),
      );
      slivers.add(
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              leading: Icon(Icons.local_offer_outlined),
              title: Text(items[index]),
            );
          }, childCount: items.length),
        ),
      );
    }

    // añadimos un footer
    slivers.add(SliverToBoxAdapter(child: SizedBox(height: 24)));

    return CustomScrollView(slivers: slivers);
  }
}

class _SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  String title;
  _SectionHeaderDelegate({required this.title});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  // Alturas mínimas y máximas del header
  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  // Indica cuando reconstruir si se cambian parámentros
  @override
  bool shouldRebuild(covariant _SectionHeaderDelegate oldDelegate) {
    return oldDelegate.title != title;
  }
}
