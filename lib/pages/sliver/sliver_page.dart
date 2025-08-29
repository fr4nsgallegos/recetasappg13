import 'package:flutter/material.dart';
import 'package:recetasappg13/pages/sliver/sliver_listbuilder_tab.dart';
import 'package:recetasappg13/pages/sliver/sliver_listdelegate_tab.dart';
import 'package:recetasappg13/pages/sliver/sliver_separated_tab.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sliverlist: Ejemplos"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Builder"),
              Tab(text: "ListDelegate"),
              Tab(text: "Separated"),
              Tab(text: "fixedExtent"),
              Tab(text: "headers"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SliverListbuilderTab(),
            SliverListdelegateTab(),
            SliverSeparatedTab(),
            Text("4"),
            Text("5"),
          ],
        ),
      ),
    );
  }
}
