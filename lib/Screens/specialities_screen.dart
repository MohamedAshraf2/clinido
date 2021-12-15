import 'package:flutter/material.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/models/speciality.dart';
import 'package:clinido/widgets/specialities_list.dart';

class SpecialitiesScreen extends StatefulWidget {
  static String id = "specialities_screen";
  const SpecialitiesScreen({Key key}) : super(key: key);

  @override
  _SpecialitiesScreenState createState() => _SpecialitiesScreenState();
}

class _SpecialitiesScreenState extends State<SpecialitiesScreen> {
  List<Speciality> specialities = [
    Speciality(
      icon: Icon(
        Icons.bug_report,
        color: Colors.lightBlueAccent,
      ),
      title: 'Allergy and Immunology (Sensitivity and Immunity)',
    ),
    Speciality(
      icon: Icon(
        Icons.person,
        color: Colors.lightBlueAccent,
      ),
      title: 'Andrology and Male Infertility',
    ),
    Speciality(
      icon: Icon(
        Icons.hearing_disabled,
        color: Colors.lightBlueAccent,
      ),
      title: 'Audiology',
    ),
    Speciality(
      icon: Icon(
        Icons.favorite,
        color: Colors.lightBlueAccent,
      ),
      title: 'Cardiology and Thorcic Surgery (Heart / Chest)',
    ),
    Speciality(
      icon: Icon(
        Icons.favorite,
        color: Colors.lightBlueAccent,
      ),
      title: 'Cardiology and Vascular Disease (Heart)',
    ),
    Speciality(
      icon: Icon(
        Icons.whatshot_outlined,
        color: Colors.lightBlueAccent,
      ),
      title: 'Chest and Respiratory',
    ),
    Speciality(
      icon: Icon(
        Icons.fastfood_outlined,
        color: Colors.lightBlueAccent,
      ),
      title: 'Dentistry (Teeth)',
    ),
    Speciality(
      icon: Icon(
        Icons.accessibility_new,
        color: Colors.lightBlueAccent,
      ),
      title: 'Dermatology (Skin)',
    ),
    Speciality(
      icon: Icon(
        Icons.all_inclusive_rounded,
        color: Colors.lightBlueAccent,
      ),
      title: 'Diabetes and Endocrinology',
    ),
    Speciality(
      icon: Icon(
        Icons.airline_seat_flat_sharp,
        color: Colors.lightBlueAccent,
      ),
      title: 'Diagnostic Radiology',
    ),
    Speciality(
      icon: Icon(
        Icons.food_bank_rounded,
        color: Colors.lightBlueAccent,
      ),
      title: 'Dietician and Nutrition',
    ),
    Speciality(
      icon: Icon(
        Icons.hearing_disabled,
        color: Colors.lightBlueAccent,
      ),
      title: 'Ear, Nose and Throat',
    ),
    Speciality(
      icon: Icon(
        Icons.family_restroom,
        color: Colors.lightBlueAccent,
      ),
      title: 'Family medicine',
    ),
    Speciality(
      icon: Icon(
        Icons.biotech,
        color: Colors.lightBlueAccent,
      ),
      title: 'Gastroenterology and Endoscopy',
    ),
    Speciality(
      icon: Icon(
        Icons.run_circle,
        color: Colors.lightBlueAccent,
      ),
      title: 'General Pracitce',
    ),
    Speciality(
      icon: Icon(
        Icons.accessible_rounded,
        color: Colors.lightBlueAccent,
      ),
      title: 'Geriatrics (Old People Health)',
    ),
    Speciality(
      icon: Icon(
        Icons.baby_changing_station_outlined,
        color: Colors.lightBlueAccent,
      ),
      title: 'Gynaecology and Infertility',
    ),
    Speciality(
      icon: Icon(
        Icons.biotech_sharp,
        color: Colors.lightBlueAccent,
      ),
      title: 'Hematology',
    ),
    Speciality(
      icon: Icon(
        Icons.ac_unit,
        color: Colors.lightBlueAccent,
      ),
      title: 'Hepatology (Liver Doctor)',
    ),
  ];
  List<Speciality> filteredList = [];

  void searchSpecialties(String searchTerm) {
    filteredList.clear();
    specialities.forEach((speciality) {
      if (speciality.title.toLowerCase().startsWith(searchTerm.toLowerCase())) {
        Speciality tempSpeciality = speciality;
        setState(() {
          filteredList.add(tempSpeciality);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Select Speciality'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey[200],
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (newText) => searchSpecialties(newText),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus.unfocus(),
        child: SpecialitiesList(
          specialities: filteredList.isEmpty ? specialities : filteredList,
        ),
      ),
    );
  }
}
