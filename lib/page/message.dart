import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _DetailMsg extends StatelessWidget {
  const _DetailMsg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Slidable.of(context).close(),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        height: 64,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 46,
              height: 46,
              child: Image.asset(
                'images/yu.webp',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
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
                )),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '昨天',
                    style: TextStyle(fontSize: 12, color: Color(0xff878B99)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageState extends State<Message> {
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  final SlidableController slidableController = SlidableController();

  _showSnackBar(text, context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$text')));
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Container(
          child: Image.asset(
            'images/logo.png',
            height: 26,
          ),
        ),
        centerTitle: false,
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 30,
              width: 56,
              padding: EdgeInsets.only(left: 13, right: 13),
              child: Image.asset(
                'images/header_view_search_icon.png',
              ),
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 56,
                padding: EdgeInsets.only(left: 13, right: 13),
                child: Image.asset(
                  'images/header_view_add_icon.png',
                ),
              )),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Slidable(
              key: Key('$index'),
              controller: slidableController,
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.15,
              child: _DetailMsg(),
//              actions: <Widget>[
//                IconSlideAction(
//                  caption: 'Archive',
//                  color: Colors.blue,
//                  icon: Icons.archive,
//                  onTap: () => _showSnackBar('Archive'),
//                ),
//                IconSlideAction(
//                  caption: 'Share',
//                  color: Colors.indigo,
//                  icon: Icons.share,
//                  onTap: () => _showSnackBar('Share'),
//                ),
//              ],
              secondaryActions: <Widget>[
//                IconSlideAction(
//                  caption: '置顶',
//                  color: Colors.black45,
//                  icon: Icons.outlined_flag,
//                  onTap: () => _showSnackBar('More'),
//                ),
//                IconSlideAction(
//                  caption: 'Delete',
//                  color: Colors.red,
//                  icon: Icons.delete,
//                  onTap: () => _showSnackBar('Delete'),
//                ),
                SlideAction(
                  color: Color(0xffC7C7CD),
                  child: Text(
                    '置顶',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    _showSnackBar('More', context);
                  },
                ),
                SlideAction(
                  color: Color(0xffFF3B2E),
                  child: Text(
                    '删除',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    _showSnackBar('More', context);
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
