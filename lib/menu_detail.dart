import 'package:flutter/material.dart';

class MenuDetail extends StatefulWidget {
  final String name;
  final String imagePath;
  final double price;

  MenuDetail(
      {Key key,
      @required this.name,
      @required this.imagePath,
      @required this.price});

  @override
  MenuDetailState createState() {
    return MenuDetailState();
  }
}

class MenuDetailState extends State<MenuDetail> {
  double total = 0;
  double unitPrice = 0;
  int quantityCounter = 0;

  double calculatePrice(int quantity) {
    setState(() {
      quantityCounter = quantity;
      unitPrice = widget.price;
      total = unitPrice * quantityCounter;
    });
    return total;
  }

  void quantityIncrement() {
    setState(() {
      quantityCounter++;
      calculatePrice(quantityCounter);
    });
  }

  void quantityDecrement() {
    setState(() {
      quantityCounter--;
      calculatePrice(quantityCounter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 500.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 12.0,
                          spreadRadius: 7.0)
                    ]),
              ),
              Container(
                height: 380.0,
                decoration: BoxDecoration(
                    color: Color(0xFFFECBC2),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
              ),
              Positioned(
                top: 15.0,
                left: 10.0,
                right: 10.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Oswald',
                              color: Colors.white),
                        ),
                      ),
                      Icon(Icons.shopping_cart, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 14.0,
                  right: 15.0,
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.pink,
                    child: Text('$quantityCounter',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 10.0,
                            color: Colors.white)),
                  )),
              Positioned(
                top: 65.0,
                left: 15.0,
                right: 15.0,
                child: Hero(
                    tag: widget.imagePath,
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(widget.imagePath),
                              fit: BoxFit.fill)),
                    )),
              ),
              Positioned(
                  top: 385.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Unit Price: ',
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 16.0,
                                    fontFamily: 'Oswal'
                                        'd'),
                              ),
                            ),
                            Text(
                              'UGX ${widget.price}',
                              style: TextStyle(
                                  fontSize: 16.0, fontFamily: 'Oswald'),
                            ),
                            Spacer(),
                            Text(
                              'Total: ',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 16.0,
                                  fontFamily: 'Oswald'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text(
                                'UGX $total',
                                style: TextStyle(
                                    fontFamily: 'Oswald', fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  quantityIncrement();
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  width: 50.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('$quantityCounter'),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  quantityDecrement();
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  width: 50.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                ),
                              ),
                              IconButton(
                                  alignment: Alignment.bottomRight,
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {})
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      )),
    );
  }
}
