import 'package:clinido/screens/confirm_reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:clinido/models/doctor.dart';

class DoctorCard extends StatefulWidget {
  final Doctor doctor;
  const DoctorCard({Key key, @required this.doctor}) : super(key: key);

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 45,
                height: 45,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.doctor.url),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        "${widget.doctor.firstName} ${widget.doctor.lastName}",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        widget.doctor.drCategory,
                        style: TextStyle(
                            // color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "First in First Out",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('5.0'),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey[600],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('19987')
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.only(left: 30, top: 15),
            height: 80,
            width: double.infinity,
            color: Colors.grey[200],
            child: Column(
              children: [
                Text(
                  '${widget.doctor.drCity} -- ${widget.doctor.drArea}',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Clinic Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.doctor.addr}',
                ),
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
                        Text('${widget.doctor.time}'),
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
                        Text('${widget.doctor.fees}'),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ConfirmScreen(doctor: widget.doctor)))
              },
              child: Text(
                "Book Tomorrow (03:00 PM -06:00PM)",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
