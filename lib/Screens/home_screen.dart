import 'package:clinido/models/doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clinido/screens/tabs/home_tab.dart';
import 'package:clinido/screens/tabs/my_bookings_tab.dart';
import 'package:clinido/screens/tabs/notifications_tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  String x = '';
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    // _auth.currentUser.
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser.uid)
          .get()
          .then((value) {
        setState(() {
          x = value.data()['displayName'];
        });
      }).catchError((e) {
        print(e);
      });
    } catch (e) {}
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        elevation: 0,
        actions: [
          Container(
            width: 100,
            height: kToolbarHeight,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: 60,
                        height: 60,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey[600],
                          ),
                        )),
                    Container(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.edit,
                            color: Colors.grey[600],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$x',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text('+01014082517')
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Divider(
                  thickness: 1.25,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
      body: _selectedIndex == 0
          ? HomeTab()
          : _selectedIndex == 1
              ? MyBookingsTab()
              : _selectedIndex == 2
                  ? NotificationsTab()
                  : Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'My Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
