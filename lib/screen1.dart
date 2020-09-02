import 'package:flutter/material.dart';
import 'package:flutter_ui_14_chat_ui_2/screen2.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  TabController tabController;
  int pageIndex;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

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
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(100),
                    child: AppBar(
                      backgroundColor: Colors.pink,
                      title: Text("Message"),
                      centerTitle: true,
                      elevation: 0,
                      leading: Icon(Icons.arrow_back_ios),
                      bottom: TabBar(
                        controller: tabController,
                        unselectedLabelColor: Colors.white.withOpacity(0.4),
                        onTap: (int index) {
                          pageIndex = index;
                        },
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Tab(
                            child: Text(
                              "Inbox",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Group",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Online",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "History",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(controller: tabController, children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 23.0, right: 23, top: 30),
                    child: ListView(
                      children: [
                        Text(
                          "Today, 23",
                          style: TextStyle(
                            color: Colors.white.withOpacity(
                              0.8,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        chatItems("Charles Valery",
                            "Hahaha, can you help me today?", "22:35"),
                        chatItems("Ellise Remmi",
                            "Alright sir, tomorrow i will come", "22:00"),
                        chatItems("Rosallie Adelyn",
                            "Yes sure I will appreciate it.", "21:35"),
                        chatItems(
                            "Charles Lueis",
                            "The beginning of my life with my good old friend is lovely.",
                            "21:15"),
                        Text(
                          "Tuesday, 22",
                          style: TextStyle(
                            color: Colors.grey.withOpacity(
                              0.8,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        chatItems("Charles Valery",
                            "Hahaha, can you help me today?", "22:35"),
                        chatItems("Ellise Remmi",
                            "Alright sir, tomorrow i will come", "22:00"),
                        chatItems("Rosallie Adelyn",
                            "Yes sure I will appreciate it.", "21:35"),
                        chatItems(
                            "Charles Lueis",
                            "The beginning of my life with my good old friend is lovely.",
                            "21:15"),
                      ],
                    ),
                  ),
                  Text("page 1"),
                  Text("page 2"),
                  Text("page 3")
                ]))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget chatItems(userName, message, time) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Screen2(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18, left: 2, right: 2),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300].withOpacity(0.7),
                  blurRadius: 2,
                  spreadRadius: 2)
            ],
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          userName,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: -0.6,
                          color: Colors.pinkAccent[400],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          message,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[500].withOpacity(0.7),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
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
    paint.style = PaintingStyle.fill;

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
