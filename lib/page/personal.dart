import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List list = [
      {'name': '我的收藏', 'img': 'images/qq_setting_shoucang.png'},
      {'name': '我的相册', 'img': 'images/qq_setting_xiangce.png'},
      {'name': '我的文件', 'img': 'images/qq_setting_file.png'},
      {'name': '钱包', 'img': 'images/qq_setting_wallet.png'},
      {'name': '设置', 'img': 'images/qq_setting_setting.png'},
      {'name': '用户反馈', 'img': 'images/qq_setting_feedback.png'},
    ];
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
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left: 3,
                            top: 3,
                            child: ClipOval(
                              child: Image.asset(
                                'images/g.jpg',
                                width: 54,
                                height: 54,
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: Color(0xff23E68A),
                              ),
                              width: 16,
                              height: 16,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '过雨',
                        style: TextStyle(fontSize: 16, color: Color(0xff03081A)),
                      ),
                      Container(
                        height: 4,
                      ),
                      Text(
                        '万寿无疆',
                        style: TextStyle(fontSize: 12, color: Color(0xff878B99)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              height: 1,
              color: Color(0xffEFEFEF),
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
