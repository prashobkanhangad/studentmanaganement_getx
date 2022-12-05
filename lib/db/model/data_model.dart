import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String no;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String classroom;

  @HiveField(4)
  final String imgurl;

  @HiveField(5)
  final int? id;

  StudentModel(
      {required this.name,
      required this.no,
      required this.age,
      required this.classroom,
      required this.imgurl, this.id
      });
}
