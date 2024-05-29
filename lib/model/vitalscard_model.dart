import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VitalsCardModel {
  final Color? figureColor;
  final String? tittle;
  final String? img;
  final String? figure;
  final String? unit;
  final DateTime? dateTime;

  VitalsCardModel(
      this.tittle, this.img, this.figure, this.unit, this.dateTime, this.figureColor);
}
