import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Item {
  final String title;

  Item({
    this.title,
  });
}

class CategoryModel extends StatelessWidget {
  final List<Item> _data = [
    Item(
      title: 'minimalis',
    ),
    Item(
      title: 'klasik',
    ),
    Item(
      title: 'skandinavia',
    ),
    Item(
      title: 'industril',
    ),
    Item(
      title: 'tradisional',
    ),
    Item(
      title: 'modern',
    ),
    Item(
      title: 'asian',
    ),
    Item(
      title: 'kontemporer',
    ),
    Item(
      title: 'tropical',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        Item item = _data[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            FadeRoute2(
              SecondPage(),
            ),
          ),
          child: Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  height: 70,
                  padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  child: Column(
                    children: [
                      Text(
                        item.title.toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FadeRoute1 extends PageRouteBuilder {
  final Widget page;

  FadeRoute1(this.page)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: page,
          ),
        );
}

class FadeRoute2 extends PageRouteBuilder {
  final Widget page;

  FadeRoute2(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1000),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return FadeTransition(
              opacity: animation,
              child: page,
            );
          },
        );
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('Fade Transition'),
      ),
    );
  }
}
