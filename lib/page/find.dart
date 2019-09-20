import 'package:flutter/material.dart';

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List list = [
      {'name': '空间', 'img': 'images/skin_icon_discovery_qzone.png'},
      {},
      {'name': '小程序', 'img': 'images/skin_icon_discovery_mini_app.png'},
      {'name': '扫一扫', 'img': 'images/add_contacts_scan.png'},
      {'name': '小游戏', 'img': 'images/skin_icon_discovery_mini_game.png'},
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('发现'),
        centerTitle: false,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 10,
            ),
            Column(
              children: list.map<Widget>((item) {
                return item.isEmpty
                    ? Container(
                        height: 10,
                      )
                    : Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 15, right: 10),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 34,
                                  height: 34,
                                  child: Image.asset(item['img']),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Text(
                                  '${item['name']}',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                )
                              ],
                            ),
                            Container(
                              child: Icon(
                                Icons.chevron_right,
                                size: 30,
                                color: Color(0xff878B99),
                              ),
                            )
                          ],
                        ),
                      );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
