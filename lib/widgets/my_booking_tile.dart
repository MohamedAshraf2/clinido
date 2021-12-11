import 'package:flutter/material.dart';

class MyBookingTile extends StatelessWidget {
  final Map<dynamic, dynamic> booking;
  const MyBookingTile({Key key, @required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 45,
                  height: 45,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/GSCT8252.jpg'),
                    // backgroundImage: widget.doctor.image,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          // "Dr. Mohammed Ashraf",
                          // "${widget.doctor.firstName} ${widget.doctor.lastName}",
                          "${booking['DoctorName']}",
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          // "Consaltent of Allgery and immunology",
                          // widget.doctor.speciality.title,
                          "${booking['DoctorCategory']}",
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.only(left: 30, top: 15),
              height: 100,
              width: double.infinity,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Text('Location'),
                  Text(
                    // 'Heliopless , 12 st boutstrab ghlya 4floor Roxy',
                    // '${widget.doctor.city.name}, ${widget.doctor.city.areas[0].name}',
                    'Mohammed Ashraf',
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Booking info'))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff2fc34b)),
                onPressed: () => {},
                child: Text(
                  "Cancel Reservation",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
