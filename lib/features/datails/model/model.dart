// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:flutter/cupertino.dart';

class CustomModel {
  IconData icon;
  String value;
  bool flag;
  CustomModel({
    required this.icon,
    required this.value,
    required this.flag,
  });
}

class CustompageModel {
  final String detail_name;
  final String detail_value;
  final String detail_value1;
  final String detail_value3;
  final String detail_mode;
  final String detail_modename;
  final CustomModel model1;
  final CustomModel model2;
  final CustomModel model3;
   double value;
  CustompageModel( {
    required this.detail_name,
    required this.detail_value,
    required this.detail_value1,
    required this.detail_value3,
    required this.detail_mode,
    required this.detail_modename,
    required this.model1,
    required this.model2,
    required this.model3,
    required this.value,
  });
}
