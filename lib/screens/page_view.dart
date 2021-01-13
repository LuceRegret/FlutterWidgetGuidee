import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  final controller = PageController(
    initialPage: 0,
  );
  var scrollDirection = Axis.horizontal;
  var actionIcon = Icons.swap_vert;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(
            'Page View Widget',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: Utils.ubuntuRegularFont),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(actionIcon),
              onPressed: () {
                setState(() {
                  scrollDirection == Axis.horizontal
                      ? scrollDirection = Axis.vertical
                      : scrollDirection = Axis.horizontal;
                  actionIcon == Icons.swap_vert
                      ? actionIcon = Icons.swap_horiz
                      : actionIcon = Icons.swap_vert;
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Scroll Direction changed to $scrollDirection"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                });
                controller.position.applyViewportDimension(
                    scrollDirection == Axis.vertical
                        ? _screenSize.height
                        : _screenSize.width);
              }),
        ],
      ),
      body: PageView(
        controller: controller,
        scrollDirection: scrollDirection,
        pageSnapping: true,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Card(
              color: Colors.lightBlue,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  "Card 1",
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.white,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Card(
              color: Colors.purpleAccent,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  "Card 2",
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.white,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Card(
              color: Colors.pink,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  "Card 3",
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.white,
                      fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
