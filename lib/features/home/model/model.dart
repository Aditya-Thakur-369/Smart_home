// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smart_home/features/datails/model/model.dart';

class Model {
  final IconData icon;
  final String value;
  final String desc;
  final String title1;
  final String title2;
  final bool flag;
  final CustompageModel model;
  Model(
      {required this.icon,
      required this.value,
      required this.desc,
      required this.title1,
      required this.title2,
      required this.flag,
      required this.model});
}
