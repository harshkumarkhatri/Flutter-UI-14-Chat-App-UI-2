import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              painter: CurvePainter(),
              child: Container(
                height: 300.0,
              ),
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.pink,
                  child: AppBar(
                    backgroundColor: Colors.pink,
                    title: Text("Message"),
                    centerTitle: true,
                    elevation: 0,
                    leading: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Inbox", style: TextStyle(color: Colors.white)),
                        Text(
                          "Group",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          "History",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23.0, right: 23),
                    child: ListView(
                      children: [
                        Text(
                          "Today, 23",
                          style: TextStyle(
                            color: Colors.white.withOpacity(
                              0.8,
                            ),
                          ),
                        ),SizedBox(height:10),chatItems(),chatItems(),chatItems(),
                        SizedBox(height: 10),
                        Container(height: 165, color: Colors.red),
                        Container(height: 165, color: Colors.white),
                        Container(height: 165, color: Colors.red),
                        Container(height: 65, color: Colors.white),
                        Container(height: 165, color: Colors.red),
                        Container(height: 165, color: Colors.white),
                        Container(height: 165, color: Colors.red)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget chatItems() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,left:2,right:2),
      child: Container(
        height: 70,
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey[300].withOpacity(0.7),blurRadius: 2,spreadRadius: 2)],
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Charles Valery",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // SizedBox(width: 30),
                    Text("22:35",
                        style: TextStyle(
                            fontSize: 14, color: Colors.pinkAccent[400]))
                  ],
                ),
                Row(
                  children: [Text("Hahaha, can you help me today?")],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.pinkAccent[400];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.55);
    path.quadraticBezierTo(
        size.width / 2, 1.5 * size.height, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// class CurvePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//     Paint paint = Paint();

//     path = Path();

//     var sw = size.width;
//     var sh = size.height;
//     // path.lineTo(0, size.height * 0.5);
//     // // path.cubicTo(0, sh / 5, sw , sh / 3, sw, sh / 3);
//     // // path.cubicTo(0, sh * 0.5, sw / 2, sh * 0.5,  (sw / 3), sh * 0.5);

//     // // // top bottom-2
//     // path.cubicTo(0,  sh*0.5,  sw / 2, sh ,
//     //      sw / 2,  sh);
//     //      path.lineTo(sw, size.height );

//     // // bottom top-2
//     // // path.lineTo(7 * sw / 12, 0);
//     // // path.cubicTo(
//     // // 7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12,0);
//     // path.cubicTo( sw / 2, sh, sw ,  sh*0.5,
//     //     sw, sh * .5);

//     path = Path();
//     path.lineTo(0, size.height * 0.50);

//     path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
//         size.width * 0.50, 1.1 * size.height * 0.99);
//     path.quadraticBezierTo(
//       size.width * 0.50,
//       1.1 * size.height * 0.99,
//       size.width * 0.96,
//       size.height * 0.50,
//     );
//     // path.cubicTo(sw * .96, sh * .5, sw, sh/2.1, sw, sh/2.05);

//     // path.quadraticBezierTo(
//     //       size.width / 2, size.height / 2, size.width, size.height * 0.25);

//     //  path.quadraticBezierTo(size.width*0.10, size.height*0.55, size.width*0.22, size.height*0.70);
//     // path.quadraticBezierTo(size.width*0.30, size.height*0.90, size.width*0.40, size.height*0.75);
//     // path.quadraticBezierTo(size.width*0.52, size.height*0.50, size.width*0.65, size.height*0.70);
//     // path.quadraticBezierTo(size.width*0.75, size.height*0.85, size.width, size.height*0.60);
//     path.quadraticBezierTo(sw * .96, sh * .40, sw, sh/2);
//     // path.lineTo(sw,sh*.45);
//     path.lineTo(size.width, 0);
//     path.close();

//     paint.color = Colors.red;
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return oldDelegate != this;
//   }
// }
