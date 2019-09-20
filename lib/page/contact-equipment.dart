import 'package:flutter/material.dart';

class ContactEquipment extends StatefulWidget {
  @override
  _ContactEquipmentState createState() => _ContactEquipmentState();
}

class _ContactEquipmentState extends State<ContactEquipment> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List contactList = [
    {'name': '我的电脑', 'avatar': 'images/qfile_dataline_pc_recent.png', 'text': '[离线]无需数据线，手机轻松传文件到电脑。'},
    {'name': '我的安卓手机', 'avatar': 'images/qfile_dataline_ipad_recent.png', 'text': '[离线]无需数据线，手机轻松传文件到电脑。'},
    {'name': '我的苹果手机', 'avatar': 'images/qfile_dataline_user_aio.png', 'text': '[离线]无需数据线，手机轻松传文件到电脑。'},
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      padding: EdgeInsets.only(left: 10, right: 10),
      children: <Widget>[
        Column(
          children: contactList.map<Widget>((item) {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 20),
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 44,
                          width: 44,
                          margin: EdgeInsets.only(right: 10),
                          child: ClipOval(
                            child: Image.asset('${item['avatar']}'),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${item['name']}',
                                  style: TextStyle(fontSize: 16, color: Color(0xff03081A)),
                                ),
                                Container(
                                  height: 4,
                                ),
                                Text('${item['text']}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 12, color: Color(0xff878B99)))
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
