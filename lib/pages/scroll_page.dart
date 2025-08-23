import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  Widget _buildContainer() {
    return Container(
      width: 300,
      height: 300,
      color: Colors.red,
      margin: EdgeInsets.all(16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll Page")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildContainer(),
            _buildContainer(),
            _buildContainer(),
            _buildContainer(),
          ],
        ),
      ),
    );
  }
}
