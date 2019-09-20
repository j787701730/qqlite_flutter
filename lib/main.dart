import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qqlite_flutter/page/contact.dart';
import 'package:qqlite_flutter/page/find.dart';
import 'package:qqlite_flutter/page/message.dart';
import 'package:qqlite_flutter/page/personal.dart';

import 'change-notifier.dart';
import 'no_splash_factory.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: CounterNotifier(),
        child: MaterialApp(
          title: 'QQ Flutter 极速版',
          theme: ThemeData(primaryColor: Colors.white, platform: TargetPlatform.iOS),
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;
  List nav = [Message(), Contact(), Find(), Personal()];
  var _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _pageChanged(int index) {
    if (mounted)
      setState(() {
        if (_tabIndex != index) _tabIndex = index;
      });
  }

  _badge(w, count) {
    double size = count == '' ? 10 : 16;
    return Positioned(
      left: w / 4 / 2 + 6,
      top: 0,
      child: Container(
        decoration:
            BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(20))),
        width: size,
        height: size,
        child: Center(
          child: Text(
            '$count',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
//      appBar: AppBar(
//        elevation: 0,
//        title: Text('文杰强人锁男'),
//        centerTitle: false,
//      ),
      body: PageView.builder(
          //要点1
          physics: NeverScrollableScrollPhysics(),
          //禁止页面左右滑动切换
          controller: _pageController,
          onPageChanged: _pageChanged,
          //回调函数
          itemCount: nav.length,
          itemBuilder: (context, index) => nav[index]),
      bottomNavigationBar: Theme(
          data: ThemeData(splashFactory: NoSplashFactory(), highlightColor: Color(0xffff)),
          child: Container(
            height: 52,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xff03081A),
              unselectedItemColor: Color(0xff83868F),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Container(
                      width: w / 4,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              _tabIndex == 0
                                  ? 'images/skin_tab_icon_conversation_selected.png'
                                  : 'images/skin_tab_icon_conversation_normal.png',
                              width: 26,
                              height: 26,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          _badge(w, '${Provider.of<CounterNotifier>(context).count + 12}')
                        ],
                      ),
                    ),
                    title: Text(
                      '消息',
                    )),
                BottomNavigationBarItem(
                    icon: Container(
                      width: w / 4,
                      child: Stack(children: <Widget>[
                        Center(
                          child: Image.asset(
                            _tabIndex == 1
                                ? 'images/skin_tab_icon_contact_selected.png'
                                : 'images/skin_tab_icon_contact_normal.png',
                            width: 26,
                            height: 26,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        _badge(w, 2)
                      ]),
                    ),
                    title: Text(
                      '联系人',
                    )),
                BottomNavigationBarItem(
                    icon: Container(
                        width: w / 4,
                        child: Stack(children: <Widget>[
                          Center(
                            child: Image.asset(
                              _tabIndex == 2
                                  ? 'images/skin_tab_icon_discovery_selected.png'
                                  : 'images/skin_tab_icon_discovery_normal.png',
                              width: 26,
                              height: 26,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          _badge(w, 3)
                        ])),
                    title: Text(
                      '发现',
                    )),
                BottomNavigationBarItem(
                    icon: Container(
                      width: w / 4,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 26,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(38)),
                                  border: Border.all(
                                      width: 1.5,
                                      color:
                                          _tabIndex == 3 ? Color(0xff03081A) : Colors.transparent),
                                  image: DecorationImage(image: AssetImage('images/g.jpg'))),
                              child: Container(
                                width: 23,
                                height: 23,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(38)),
                                    border: Border.all(
                                        width: 1.5,
                                        color: _tabIndex == 3 ? Colors.white : Colors.transparent)),
                              ),
                            ),
                          ),
                          _badge(w, '')
                        ],
                      ),
                    ),
                    title: Text(
                      '我',
                    )),
              ],
              currentIndex: _tabIndex,
              onTap: (index) {
                if (mounted)
                  setState(() {
                    _tabIndex = index;
                  });
                _pageController.jumpToPage(index);
              },
            ),
          )),
    );
  }
}
