import 'package:flutter/material.dart';

class ContactGroup extends StatefulWidget {
  @override
  _ContactGroupState createState() => _ContactGroupState();
}

class _ContactGroupState extends State<ContactGroup> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List contactList = [
    {
      'name': '我创建的群聊',
      'show': false,
      'list': [
        {'name': '找小姐姐群', 'avatar': 'images/yu.webp'},
        {'name': '找大姐姐群', 'avatar': 'images/yu.webp'},
      ]
    },
    {
      'name': '我加入的群聊',
      'show': false,
      'list': [
        {'name': '福州会所群', 'avatar': 'images/yu.webp'},
        {'name': '杭州会所群', 'avatar': 'images/yu.webp'},
        {'name': '三明会所群', 'avatar': 'images/yu.webp'},
        {'name': '泉州会所群', 'avatar': 'images/yu.webp'},
        {'name': '上海会所群', 'avatar': 'images/yu.webp'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      padding: EdgeInsets.only(left: 10, right: 10),
      children: <Widget>[
        Column(
          children: contactList.map<Widget>((item) {
            int index = contactList.indexOf(item);
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      contactList[index]['show'] = !contactList[index]['show'];
                    });
                  },
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                item['show'] ? Icons.arrow_drop_down : Icons.arrow_right,
                                size: 30,
                              ),
                              Text('${item['name']}',
                                  style: TextStyle(fontSize: 16, color: Color(0xff03081A)))
                            ],
                          ),
                        ),
                        Container(
                          child: Text('${item['list'].length}',
                              style: TextStyle(fontSize: 12, color: Color(0xff878B99))),
                        )
                      ],
                    ),
                  ),
                ),
                Offstage(
                  offstage: !item['show'],
                  child: Column(
                    children: item['list'].map<Widget>((list) {
                      return Container(
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
                                child: Image.asset('${list['avatar']}'),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${list['name']}',
                                      style: TextStyle(fontSize: 16, color: Color(0xff03081A)),
                                    ),
//                                    Container(
//                                      height: 4,
//                                    ),
//                                    Text('${list['text']}',
//                                        maxLines: 1,
//                                        overflow: TextOverflow.ellipsis,
//                                        style: TextStyle(fontSize: 12, color: Color(0xff878B99)))
                                  ],
                                ))
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
