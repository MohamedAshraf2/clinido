import 'package:flutter/material.dart';

class SpecialityTile extends StatelessWidget {
  final String specialityTitle;
  final Icon specialityIcon;
  final Function tapCallback;
  const SpecialityTile(
      {Key key, this.specialityTitle, this.specialityIcon, this.tapCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: this.specialityIcon,
        title: Text(specialityTitle),
        onTap: () => this.tapCallback(),
      ),
    );
  }
}
