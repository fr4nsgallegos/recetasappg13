import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  Widget _buildContainer(int number) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.red,
      margin: EdgeInsets.all(16),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll Page")),
      body: Column(
        children: [
          Text("Texto estático sin scroll"),
          Expanded(
            child: ListView.builder(
              itemCount: 200,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                return _buildContainer(index);
              },
            ),
          ),

          // Expanded(
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.vertical,
          //     child: Column(
          //       children: [
          //         _buildContainer(),
          //         _buildContainer(),
          //         _buildContainer(),
          //         _buildContainer(),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
