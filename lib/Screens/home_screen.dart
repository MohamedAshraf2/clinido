import 'package:clinido/models/doctor.dart';
import 'package:clinido/screens/chat_screen.dart';
import 'package:clinido/screens/settings/about_us_screen.dart';
import 'package:clinido/screens/settings/contact_us_screen.dart';
import 'package:clinido/screens/settings/privacy_screen.dart';
import 'package:clinido/screens/settings/terms_screen.dart';
import 'package:clinido/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clinido/screens/tabs/home_tab.dart';
import 'package:clinido/screens/tabs/my_bookings_tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  bool isBookingDone;
  int selectedTabIndex;
  HomeScreen({Key key, this.selectedTabIndex, this.isBookingDone = false})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  String username = '';

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    setState(() {
      _selectedIndex =
          widget.selectedTabIndex != null ? widget.selectedTabIndex : 0;
    });
    // getDocrorsdata();
    Future.delayed(const Duration(milliseconds: 100), () {
      showSuccessSnack();
    });
  }

  void showSuccessSnack() {
    if (widget.isBookingDone == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        'Reservation added successfully',
        style: TextStyle(color: Colors.green),
      )));
      widget.isBookingDone = false;
    }
  }

  /* getDocrorsdata() async {
    final _docrorss = await store.collection("Doctor").get();
    for (var doctor in _docrorss.docs) {
      Map<String, dynamic> tempDoctor = doctor.data();
      tempDoctor.addAll({'id': doctor.id});
      // doctorsss.add(Doctor.fromJson(doctor.data(), doctor.id));
      doctorsss.add(tempDoctor);
    }
  } */

  void getCurrentUser() async {
    // _auth.currentUser.
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser.uid)
          .get()
          .then((value) {
        setState(() {
          username = value.data()['displayName'];
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Hello : $username',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Container(
                  child: Column(
                    children: [Text('+01014082517')],
                  ),
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
              // Privacy & Polocy
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => PrivacyScreen())),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.assignment_rounded,
                        color: Colors.lightBlueAccent,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('Privacy & Polocy'),
                      )
                    ],
                  ),
                ),
              ),
              // Teerms & Conditions
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => TermsScreen())),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.privacy_tip,
                        color: Colors.lightBlueAccent,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('Teerms & Conditions'),
                      )
                    ],
                  ),
                ),
              ),
              // About Us
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AboutUsScreen())),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.lightBlueAccent,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('About Us'),
                      )
                    ],
                  ),
                ),
              ),
              // Contact Us
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ContactUsScreen())),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.lightBlueAccent,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text('Contact Us ')),
                    ],
                  ),
                ),
              ),

              //Chat us
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ChatScreen())),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.message,
                        color: Colors.lightBlueAccent,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text('General Chat ')),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1.25,
                  color: Colors.grey[400],
                ),
              ),
              // Logout

              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => WelcomeScreen()));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.lightBlueAccent,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('Logout'),
                      )
                    ],
                  ),
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
