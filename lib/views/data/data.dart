import 'package:contra_care/views/faqs.dart';
import 'package:flutter/cupertino.dart';
import 'package:contra_care/views/data/name.dart';
import 'package:flutter/material.dart';

List<SpecialityModel> getSpeciality() {
  List<SpecialityModel> specialities = new List<SpecialityModel>();
  SpecialityModel specialityModel = new SpecialityModel();

  //1
  specialityModel.noOfDoctors = 10;
  specialityModel.speciality = "TRACKER";
  specialityModel.imgAssetPath = "assets/images/onboard1.png";
  specialityModel.navPath = "contra_care/views/brandsinfo.dart";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //2
  specialityModel.noOfDoctors = 11;
  specialityModel.speciality = "I-PILL";
  specialityModel.imgAssetPath = "assets/images/onboard2.png";
  specialityModel.navPath = "assets/images/onboard1.png";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //3
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "E-PILL";
  specialityModel.imgAssetPath = "assets/images/onboard3.png";
  specialityModel.navPath = "assets/images/onboard1.png";
  specialityModel.backgroundColor = Color(0xffeacbcb);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //4
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "MAX";
  specialityModel.imgAssetPath = "assets/images/onboard3.png";
  specialityModel.navPath = "assets/images/onboard1.png";
  specialityModel.backgroundColor = Color(0xff69768B);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();
  return specialities;
}