import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/models/city.dart';
import 'package:clinido/models/area.dart';
import 'package:clinido/models/speciality.dart';
import 'package:clinido/screens/specialities_screen.dart';
import 'package:clinido/widgets/doctor_card.dart';

class HomeTab extends StatefulWidget {
  final Map<String, dynamic> doctor;

  const HomeTab({this.doctor});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final store = FirebaseFirestore.instance;
  // final List<Doctor> doctorsss = [];
  final List<Map<String, dynamic>> doctorsss = [];

  getDocrorsdata() async {
    final _docrorss = await store.collection("Doctor").get();
    for (var doctor in _docrorss.docs) {
      Map<String, dynamic> tempDoctor = doctor.data();
      tempDoctor.addAll({'id': doctor.id});
      // doctorsss.add(Doctor.fromJson(doctor.data(), doctor.id));
      doctorsss.add(tempDoctor);
    }
  }

  // List<Doctor> doctors = [
  /* Doctor.fromJson({
      "id": "GIkPmBoKqR4CJwhwf5he",
      "firstName": "Ibrahim",
      "lastName": "Khaled",
      "speciality": {
        "title": "Audiology",
        "id": "uieghfjksdb",
      },
      "mobile": "0123456",
      "city": {
        "id": "jsdkefghsdfhjkbfg",
        "name": "Cairo",
        "areas": [
          {
            "id": "euifhjksdbg",
            "name": "dokki",
          }
        ]
      },
    }),
    Doctor.fromJson({
      "id": "GIkPmBoKqR4CJwhwf5he",
      "firstName": "Ibrahim",
      "lastName": "Khaled",
      "speciality": {
        "title": "Audiology",
        "id": "uieghfjksdb",
      },
      "mobile": "0123456",
      "city": {
        "id": "jsdkefghsdfhjkbfg",
        "name": "Cairo",
        "areas": [
          {
            "id": "euifhjksdbg",
            "name": "dokki",
          }
        ]
      },
    }),
  //   */
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Family medicine",
  //     "drCity": "Alexandria",
  //     "firstName": "Hafsa",
  //     "id": "HNzaUhWDHbveIPsujIyj",
  //     "lastName": "Ahmed",
  //     "mobile": "0200",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Andrology and Male Infertility",
  //     "drCity": "El Ismailia",
  //     "firstName": "Hafsa",
  //     "id": "MqDWf1bRmHMcMfY8k4nm",
  //     "lastName": "Ali",
  //     "mobile": "011299",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Gynaecology and Infertility",
  //     "drCity": " Sharm El Sheikh",
  //     "firstName": "Omar",
  //     "id": "OMaQvG2W2QVV6JF4Uarh",
  //     "lastName": "Emad",
  //     "mobile": "0123456",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Dentistry (Teeth)",
  //     "drCity": "El Sharqia",
  //     "firstName": "Hady",
  //     "id": "OoM1NXQHKFN3hkqLY4GS",
  //     "lastName": "Hesham",
  //     "mobile": "019",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Choose Category",
  //     "drCity": "Alexandria",
  //     "firstName": "Abbot",
  //     "id": "QFRU0ZPxbTLNpQS3FsV5",
  //     "lastName": "Cook",
  //     "mobile": "+1 (767) 826-1304",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Dermatology (Skin)",
  //     "drCity": "Cairo",
  //     "firstName": "Ali",
  //     "id": "QehCPXUxIN3v1jex5cTk",
  //     "lastName": "Eslam",
  //     "mobile": "0123456",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Diabetes and Endocrinology",
  //     "drCity": " Port Said",
  //     "firstName": "Wayne",
  //     "id": "RWWwKOWhlB5Gbxx0bNON",
  //     "lastName": "Reese",
  //     "mobile": "+1 (857) 991-6497",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "General Surgery",
  //     "drCity": "Luxor",
  //     "firstName": "Dennis",
  //     "id": "XvktI1WcFHHYlw5PWthc",
  //     "lastName": "Harmon",
  //     "mobile": "+1 (517) 614-4154",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Andrology and Male Infertility",
  //     "drCity": "Menoufia",
  //     "firstName": "Mohaned",
  //     "id": "iFxgXxPgwfe1uH0e2zAc",
  //     "lastName": "Honda",
  //     "mobile": "013",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Cardiology and Vascular Disease (Heart)",
  //     "drCity": "El Ismailia",
  //     "firstName": "Mosallem",
  //     "id": "ixedHHcVuP91SWUmfvMC",
  //     "lastName": "Ahmed",
  //     "mobile": "019",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Cardiology and Thorcic Surgery (Heart / Chest)",
  //     "drCity": "Assuit",
  //     "firstName": "Mohammed ",
  //     "id": "olNSXZzL14kxddMfz8mD",
  //     "lastName": "Ashraf",
  //     "mobile": "011",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Gynaecology and Infertility",
  //     "drCity": "El Dakahlia",
  //     "firstName": "Sydnee",
  //     "id": "u5IaiFojrkkHxBS4JiP4",
  //     "lastName": "Meadows",
  //     "mobile": "+1 (703) 865-2923",
  //   }),
  //   Doctor.fromJson({
  //     "drArea": "dokki",
  //     "drCategory": "Andrology and Male Infertility",
  //     "drCity": "Luxor",
  //     "firstName": "Mohamed",
  //     "id": "xDauLl3tcoF8ikjDP7bb",
  //     "lastName": "Farag",
  //     "mobile": "0123456",
  //   }),
  // ];

  @override
  void initState() {
    super.initState();
    getDocrorsdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        'Need a doctor?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        'Book online or call us to help you',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    elevation: 4,
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      maxRadius: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: kToolbarHeight,
            margin: EdgeInsets.only(top: 8, bottom: 12, left: 8, right: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              // color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SpecialitiesScreen(
                          doctos: doctorsss,
                        )));
              },
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      Icons.search,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Text(
                    'Book an appointment in Clinic',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Divider(
              thickness: 1.25,
              color: Colors.grey[400],
            ),
          ),
          ElevatedButton(
              // onPressed: () => print('${doctorsss[0].toMap()}'),
              onPressed: () {
                doctorsss.forEach((doctor) {
                  print(doctor);
                });
              },
              child: Text('Doctors data')),
          Expanded(
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: doctorsss.map((doctor) {
                  return Builder(
                    builder: (BuildContext context) {
                      return DoctorCard(doctor: widget.doctor);
                    },
                  );
                }).toList(),
              ),
            ),
          )

          /* Container(
            width: 350,
            margin: EdgeInsets.only(top: 30),
            child: DoctorCard(),
          ), */
        ],
      ),
    );
  }
}
