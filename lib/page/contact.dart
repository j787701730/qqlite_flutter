import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter/material.dart' as prefix0;
import 'package:qqlite_flutter/page/contact-friend.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> with SingleTickerProviderStateMixin {
  TabController controller;

  var tabs = <Tab>[
    Tab(
      text: "    好友    ",
    ),
    Tab(
      text: "    群聊    ",
    ),
    Tab(
      text: "    设备    ",
    ),
  ];

  PageController _pageController;
  var tabView = [
    ContactFriend(),
    Container(
      child: Text('群聊'),
    ),
    Container(
      child: Text('设备'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(initialIndex: 0, length: tabs.length, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  _timeSelection() {
    return Stack(
      children: <Widget>[
        Container(
          padding: prefix0.EdgeInsets.only(top: 10),
          color: prefix0.Colors.white,
          height: 50,
        ),
        TabBar(
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(width: 10, color: Colors.white),
              bottom: BorderSide(width: 10, color: Colors.white),
            ),
            color: Color(0xffF5F6FA),
//              borderRadius: BorderRadius.all(prefix0.Radius.circular(10))
          ),
          indicatorSize: TabBarIndicatorSize.label,
          controller: controller,
          tabs: tabs,
          onTap: (index) {
            _pageController.jumpToPage(index); // 与PageView的互动
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
//    double pt = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('联系人'),
        actions: <Widget>[
          GestureDetector(
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
            child: Container(
              height: 30,
              width: 56,
              padding: EdgeInsets.only(left: 13, right: 13),
              child: Image.asset(
                'images/header_view_add_friend.png',
              ),
            ),
          ),
        ],
//        bottom: TabBar(
//          controller: controller,
//          tabs: tabs,
//          onTap: (index) {
//            _pageController.jumpToPage(index); // 与PageView的互动
//          },
//        ),
      ),
//      body: PageView(
//        controller: _pageController,
////        physics: NeverScrollableScrollPhysics(), // 禁止左右滑动
//        children: tabView,
//        onPageChanged: (index) {
//          controller.animateTo(index); // 与TabBar的互动
//        },
//      ),
      body: NestedScrollView(
          pinnedHeaderSliverHeightBuilder: () {
            return 50;
          },
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
//                  centerTitle: false,
//                  title: Text('联系人'),
//                  actions: <Widget>[
//                    GestureDetector(
//                      child: Container(
//                        height: 30,
//                        width: 56,
//                        padding: EdgeInsets.only(left: 13, right: 13),
//                        child: Image.asset(
//                          'images/header_view_search_icon.png',
//                        ),
//                      ),
//                    ),
//                    GestureDetector(
//                      child: Container(
//                        height: 30,
//                        width: 56,
//                        padding: EdgeInsets.only(left: 13, right: 13),
//                        child: Image.asset(
//                          'images/header_view_add_friend.png',
//                        ),
//                      ),
//                    ),
//                  ],
                  backgroundColor: Color(0xfff1f1f1),
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(child: Container(), preferredSize: Size.fromHeight(10)),

                  ///TabBar顶部收缩的部分
                  flexibleSpace: Column(
                    children: <Widget>[
                      Container(
                        height: 60,
                        padding: EdgeInsets.only(top: 6),
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 15),
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('新朋友'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///停留在顶部的TabBar
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(_timeSelection()),
                pinned: true,
              ),
            ];
          },
          body: PageView(
            controller: _pageController,
//        physics: NeverScrollableScrollPhysics(), // 禁止左右滑动
            children: tabView,
            onPageChanged: (index) {
              controller.animateTo(index); // 与TabBar的互动
            },
          )),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Stack _tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
