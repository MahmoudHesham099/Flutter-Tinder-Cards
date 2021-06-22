import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _images = [
    "woman1.png",
    "woman2.png",
    "woman3.png",
    "woman4.png",
    "woman5.png",
    "woman6.png",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff7cc8cc),
      appBar: AppBar(
        backgroundColor: Color(0xff76c9b2),
        centerTitle: true,
        title: Text('Flutter Tinder Cards'),
      ),
      body: Center(
        child: Container(
          height: screenHeight - 200,
          child: TinderSwapCard(
            allowVerticalMovement: false,
            totalNum: _images.length,
            stackNum: 3,
            maxHeight: screenHeight * 0.7,
            maxWidth: screenWidth * 0.9,
            minWidth: screenWidth * 0.8,
            minHeight: screenHeight * 0.65,
            cardBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      color: Color(0xff76c9b2),
                      child: Image.asset('assets/${_images[index]}'),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.close,
                          size: 100,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.favorite,
                          size: 100,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              if (orientation == CardSwipeOrientation.LEFT) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Left'),
                    duration: Duration(milliseconds: 200),
                  ),
                );
              } else if (orientation == CardSwipeOrientation.RIGHT) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Right'),
                    duration: Duration(milliseconds: 200),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
