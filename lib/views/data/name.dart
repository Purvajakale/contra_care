import 'package:flutter/cupertino.dart';

class SpecialityModel {
  String imgAssetPath;
  String navPath;
  String speciality;
  int noOfDoctors;
  Color backgroundColor;
  SpecialityModel(
      {this.imgAssetPath,
      this.navPath,
      this.speciality,
      this.noOfDoctors,
      this.backgroundColor});
}