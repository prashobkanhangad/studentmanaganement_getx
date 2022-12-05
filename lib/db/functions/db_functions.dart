// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:studentrecordbook/db/model/data_model.dart';

// ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

// Future<void> addStudent(StudentModel value) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   final addingdata = await studentDB.add(value);
//   log(addingdata.toString());

//   // studentListNotifier.value.add(value);

//   // log(value.toString());

//   // studentListNotifier.notifyListeners();
// }

// Future<void> getAllStudents() async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   studentListNotifier.value.clear();
//   studentListNotifier.value.addAll(studentDB.values);
//   studentListNotifier.notifyListeners();
// }

// Future<void> deletestudent(index)async{
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   studentDB.deleteAt(index);
//   getAllStudents();
// }

// Future<void> editstudent(index, value)async{
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   studentDB.putAt(index, value);
//   getAllStudents();
// }