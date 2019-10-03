import 'package:flutter/material.dart';
import 'package:imran_restaurant/menu.dart';
import 'package:imran_restaurant/menu_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imran Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var menu = menuItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFECBC2),
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Imran Restaurant',
            style: TextStyle(
                fontFamily: 'Oswald'
                    '',
                color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white), onPressed: () {}),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {})
          ],
        ),
        body: ListView(
          children: menu.map((menu) {
            return menuListItem(menu);
          }).toList(),
        ));
  }

  Widget menuListItem(menu) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MenuDetail(
                name: menu.name, imagePath: menu.image, price: menu.price);
          }));
        },
        splashColor: Colors.lightBlue,
        child: Container(
          height: 310.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [BoxShadow(color: Colors.white)]),
          child: Stack(
            children: <Widget>[
              Hero(
                tag: menu.image,
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(menu.image),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              Positioned(
                top: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 10.0),
                      child: Text(
                        menu.name,
                        style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            fontFamily: 'Oswald'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Units: ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                fontFamily: 'Oswal'
                                    'd'),
                          ),
                          Text(
                            menu.unit,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                fontFamily: 'Oswald'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Price: ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                fontFamily: 'Oswal'
                                    'd'),
                          ),
                          Text(
                            'UGX ${menu.price}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                fontFamily: 'Oswald'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
