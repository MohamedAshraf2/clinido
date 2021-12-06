import 'package:flutter/material.dart';

class MyBookingsTab extends StatefulWidget {
  const MyBookingsTab({Key key}) : super(key: key);

  @override
  _MyBookingsTabState createState() => _MyBookingsTabState();
}

class _MyBookingsTabState extends State<MyBookingsTab> {
  bool texCheck = true;

  void booking() {
    setState(() {
      texCheck = true;
    });
  }

  void consult() {
    setState(() {
      texCheck = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "My BooKings",
              style: TextStyle(
                color: Color(0xff004f6c),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  width: 180,
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () => {booking()},
                    child: Text("My BooKings"),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () => {consult()},
                    child: Text("My online Consultation"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90),
            child: Icon(
              Icons.calendar_today_rounded,
              color: Colors.grey[500],
              size: 160,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: texCheck
                ? Text(
                    "MY Bookings",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  )
                : Text(
                    "My Consultations",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "you don't have any booking",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xff2fc34b)),
              onPressed: () => {},
              child: Text(
                "Book Now",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

// Root View Column
// Text
// Tab Bar View 
// My Bokkings Tab
// My Consultations Tab
