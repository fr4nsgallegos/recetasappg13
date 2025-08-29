import 'package:flutter/material.dart';
import 'package:recetasappg13/pages/sliver/sliver_listbuilder_tab.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sliverlist: Ejemplos"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Builder"),
              Tab(text: "Perfil"),
            ],
          ),
        ),
        body: TabBarView(children: [SliverListbuilderTab(), Text("Perfil")]),
      ),
    );
  }
}
