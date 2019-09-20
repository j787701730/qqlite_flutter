import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              height: 24,
              width: 56,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Image.asset(
                'images/qq_profilecard_icon_qrcode.png',
              ),
            ),
          ),
        ],
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
