import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TabbedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabContainer();
  }
}

class TabContainer extends StatefulWidget {
  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer>
    with TickerProviderStateMixin {
  ScrollController _controller;
  String message = "";
  int currentIndex = 0;
  TabController tabController;
  File _image;

  Future galleryImageSelector() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    print("you have selected gallery image:" + image.path);

    setState(() {
      _image = image;
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    _controller = ScrollController();
    tabController = new TabController(length: 9, vsync: this);
    _controller.addListener(_scrollEventListener);
    _image = File("assets/images/quit.png");
    super.initState();
  }

  _scrollEventListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the end";
        print('reach the end');

        tabController.animateTo(tabController.index + 1);
        currentIndex++;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the start";
        print('reach the start');
        if (currentIndex > 0) {
          tabController.animateTo(tabController.index - 1);
          currentIndex--;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Scaffold s = new Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: getDrawerView(),
      ),
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Gallery"),
        bottom: new TabBar(
          controller: tabController,
          isScrollable: true,
          labelColor: Colors.white,
          tabs: getTabs(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: getTabData(),
      ),
    );
    return MaterialApp(
      home: s,
    );
  }

  List<Widget> getTabData() {
    return <Widget>[
      getTabContent(1),
      getTabContent(2),
      getTabContent(3),
      getTabContent(4),
      getTabContent(5),
      getTabContent(6),
      getTabContent(7),
      getTabContent(8),
      getTabContent(9),
    ];
  }

  List<Widget> getTabs() {
    return <Widget>[
      new Tab(
        text: "Tab 1",
        icon: Icon(Icons.android),
      ),
      new Tab(
        text: "Tab 2",
        icon: Icon(Icons.android),
      ),
      new Tab(
        text: "Tab 3",
        icon: Icon(Icons.android),
      ),
      new Tab(
        text: "Tab 4",
        icon: Icon(Icons.android),
      ),
      new Tab(
        text: "Tab 5",
        icon: Icon(Icons.android),
      ),
      new Tab(
        text: "Tab 6",
        icon: Icon(Icons.android),
      ),
      new Tab(
        text: "Tab 7",
        icon: Icon(Icons.android),
      ),
      new Tab(
        text: "Tab 8",
        icon: Icon(Icons.android),
      ),
      new Tab(
        text: "Tab 9",
        icon: Icon(Icons.android),
      ),
    ];
  }

  /***
   * return widget for first tab
   */
  Widget getTabContent(int i) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        children: <Widget>[
          Icon(
            Icons.android,
            size: 300,
          ),
          Icon(
            Icons.home,
            size: 300,
          ),
          Icon(
            Icons.favorite,
            size: 300,
          )
        ],
      ),
    );
  }

  getDrawerView() {
    return DrawerHeader(
        child: new ListView(
      children: <Widget>[
        GestureDetector(
          child: DrawerHeader(
            child: Container(
              child: Image.file(_image),
            ),
          ),
          onTap: () {
            print("tapped in the drawer header");
            // getImage();
            galleryImageSelector();
          },
        ),
        ListTile(
          title: new Text(
            "tab 1",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 2",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 3",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 4",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 5",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 6",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 7",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 8",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 9",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: new Text(
            "tab 10",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ));
  }
}
