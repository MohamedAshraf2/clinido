import 'package:flutter/material.dart';
import 'package:clinido/widgets/specialities_list.dart';

class SpecialitiesScreen extends StatefulWidget {
  const SpecialitiesScreen({Key key}) : super(key: key);

  @override
  _SpecialitiesScreenState createState() => _SpecialitiesScreenState();
}

class _SpecialitiesScreenState extends State<SpecialitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SpecialitiesList(),
    );
  }
}
