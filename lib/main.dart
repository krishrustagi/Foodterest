import 'package:final_project/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hovering/hovering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodterest',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: CreateApp(),
    );
  }
}

class CreateApp extends StatefulWidget {
  @override
  _CreateAppState createState() => _CreateAppState();
}

// https://pub.dev/packages/flutter_staggered_grid_view
class _CreateAppState extends State<CreateApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              "assets/icon.jpg",
            ),
            iconSize: 100,
            onPressed: () {},
          ),
          title: Row(children: [
            FlatButton(
              height: 50,
              hoverColor: Colors.grey[800],
              child: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () => {},
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            FlatButton(
              height: 50,
              child: Text(
                'Today',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              hoverColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () => {},
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Expanded(
                child: TextField(
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(55.0),
                  borderSide: BorderSide.none,
                ),
                hintText: " Search",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            )),
          ]),
          actions: <Widget>[
            IconButton(
                hoverColor: Colors.grey[200],
                splashRadius: 20,
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.grey[500],
                )),
            IconButton(
                hoverColor: Colors.grey[200],
                splashRadius: 20,
                onPressed: () {},
                icon: Icon(
                  Icons.messenger_rounded,
                  // size: 5,
                  color: Colors.grey[500],
                )),
            IconButton(
                hoverColor: Colors.grey[200],
                splashRadius: 20,
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[500],
                )),
            Padding(
              padding: EdgeInsets.only(left: 15),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(16.0),
          crossAxisCount: 8,
          itemCount: 25,

          // https://pub.dev/packages/hovering/example
          itemBuilder: (BuildContext context, int index) => new HoverWidget(
            hoverChild: new Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          // https://stackoverflow.com/questions/44612599/make-boxdecoration-image-faded-transparent
                          Colors.black.withOpacity(0.85),
                          BlendMode.dstATop),
                      fit: BoxFit.fill,
                      image: AssetImage(images[index])),
                ),
                child: new Stack(
                  children: [
                    Positioned(
                        top: 7.0,
                        right: 7.0,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Save"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side:
                                            BorderSide(color: Colors.red)))))),
                    Positioned(
                      bottom: 7.0,
                      left: 7.0,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          iconSize: 18,
                          onPressed: () {},
                          icon: Icon(
                            Icons.link,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 7.0,
                      right: 7.0,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              iconSize: 18,
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                          ),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              iconSize: 18,
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_horiz_outlined,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            onHover: (event) {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(images[index])),
              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, (index % 4 == 0) ? 1 : 2),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ));
  }
}
