import 'package:flutter/material.dart';

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('发现'),
        centerTitle: false,
      ),
      body: Container(
        child: Center(
          child: Text(
            '联系人',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
