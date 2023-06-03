import 'package:flutter/material.dart';

class Appointment {
  late DateTime date;
  late String time;
  late String specialist;

  Appointment({
    required this.date,
    required this.time,
    required this.specialist,
  });

  void setDate(DateTime newDate) {
    date = newDate;
  }

  void setTime(String newTime) {
    time = newTime;
  }

  void setSpecialist(String newSpecialist) {
    specialist = newSpecialist;
  }
}