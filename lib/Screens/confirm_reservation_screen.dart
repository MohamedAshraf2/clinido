import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clinido/screens/home_screen.dart';
import 'package:intl/intl.dart';

class ConfirmScreen extends StatefulWidget {
  static String id = "confirm_screen";
  final Map<String, dynamic> doctor;
  const ConfirmScreen({this.doctor});

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final _auth = FirebaseAuth.instance;
  CollectionReference booking =
      FirebaseFirestore.instance.collection('Booking');

  String username = '';
  String emaill = "";
  String phonee = '';

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // String validateMobile(String value) {
  //   String patttern = r'(^(?:[+0]1)?[0-9]{10,12}$)';
  //   RegExp regExp = new RegExp(patttern);
  //   if (value.length == 0) {
  //     return 'Please enter mobile number';
  //   } else if (!regExp.hasMatch(value)) {
  //     return 'Please enter valid mobile number';
  //   }
  //   return null;
  // }

  void setphone(vall) {
    setState(() {
      phonee = vall;
    });
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
          username = value.data()['displayName'];
        });
        setState(() {
          emaill = value.data()['email'];
        });
      }).catchError((e) {
        print(e);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    String now = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Your Reservation'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.person),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.doctor['firstName']} ${widget.doctor['lastName']}",
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 200,
                            child: Text(
                              "${widget.doctor['drCategory']}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_alarm,
                          size: 50,
                          color: Colors.lightBlueAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              'Waiting Time',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('15 Minutes'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 50,
                          color: Colors.lightBlueAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              'Fees',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('400 EGP'),
                          ],
                        )
                      ],
                    ),
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
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Pationt Name",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$username',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Container(
                              width: 360,
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Text(
                                    "Enter Your Phone Number",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    width: double.infinity,
                                    height: 50,
                                    child: TextField(
                                      onChanged: (val) => {setphone(val)},
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'User Phone',
                                        hintText: 'Enter Your Phone',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xff2fc34b)),
                  onPressed: () => {
                    booking.add({
                      'DoctorCategory': '${widget.doctor['drCategory']}',
                      'DoctorName':
                          '${widget.doctor['firstName']} ${widget.doctor['lastName']}',
                      'email': '$emaill',
                      'name': '$username',
                      'phone': '$phonee',
                    }).then((value) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(_auth.currentUser.uid)
                          .get()
                          .then((fu) {
                        List<dynamic> tb = fu.data()['bookings'] != null
                            ? fu.data()['bookings']
                            : [];
                        tb.add({
                          'DoctorCategory': '${widget.doctor['drCategory']}',
                          'DoctorPhone': '${widget.doctor['mobile']}',
                          'DoctorName':
                              '${widget.doctor['firstName']} ${widget.doctor['lastName']}',
                          'email': '$emaill',
                          'name': '$username',
                          'phone': '$phonee',
                          'resevationTime': '$now'
                        });
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(_auth.currentUser.uid)
                            .update({
                          'bookings': tb,
                        }).then((value) => Navigator.of(context).popUntil(
                                (value) =>
                                    value.settings.name == HomeScreen.id));
                      });
                    }).catchError((e) => {print('Failld ya 3beet')})
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
