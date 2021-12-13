import 'package:flutter/material.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/models/speciality.dart';
import 'package:clinido/widgets/specialities_list.dart';

class SpecialitiesScreen extends StatefulWidget {
  static String id = "specialities_screen";
  // final List<Doctor> doctos;
  final List<Map<String, dynamic>> doctors;
  const SpecialitiesScreen({Key key, @required this.doctors}) : super(key: key);

  @override
  _SpecialitiesScreenState createState() => _SpecialitiesScreenState();
}

class _SpecialitiesScreenState extends State<SpecialitiesScreen> {
  List<Speciality> specialities = [
    Speciality(
      icon: Icon(Icons.bug_report),
      title: 'Allergy and Immunology (Sensitivity and Immunity)',
    ),
    Speciality(
      icon: Icon(Icons.person),
      title: 'Andrology and Male Infertility',
    ),
    Speciality(
      icon: Icon(Icons.hearing_disabled),
      title: 'Audiology',
    ),
    Speciality(
      icon: Icon(Icons.favorite),
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
      icon: Icon(Icons.face),
      title: 'Chest and Respiratory',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Dentistry (Teeth)',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Dermatology (Skin)',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Diabetes and Endocrinology',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Diagnostic Radiology',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Dietician and Nutrition',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Ear, Nose and Throat',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Family medicine',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Gastroenterology and Endoscopy',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'General Pracitce',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Geriatrics (Old People Health)',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Gynaecology and Infertility',
    ),
    Speciality(
      icon: Icon(Icons.settings),
      title: 'Hematology',
    ),
    Speciality(
      icon: Icon(Icons.settings),
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
          doctors: widget.doctors,
        ),
      ),
    );
  }
}
