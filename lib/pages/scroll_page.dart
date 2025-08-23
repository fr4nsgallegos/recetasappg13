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

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 200,
          //     itemBuilder: (BuildContext context, int index) {
          //       print(index);
          //       return _buildContainer(index);
          //     },
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  _buildContainer(1),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return _buildContainer(index);
                      },
                    ),
                  ),
                  _buildContainer(2),
                  _buildContainer(3),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          Container(height: 20, width: 5, color: Colors.cyan),
                      itemCount: 50,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildContainer(index);
                      },
                    ),
                  ),
                  _buildContainer(4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
