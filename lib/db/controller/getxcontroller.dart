import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

import '../model/data_model.dart';

class studentgetxController extends GetxController {
  void onReady() async {
    list.clear();
    final studentDB = await Hive.openBox<StudentModel>('student_db');

    list.addAll(studentDB.values);
    update();

    super.onReady();
  }

  XFile? imageurl;
  final studentList = [];
  var list = <StudentModel>[];
  List<StudentModel> addedstudentlist = [];

  Future<void> picmarketimagefromGallery() async {
    XFile? pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    imageurl = pickedfile;

    if (pickedfile == null) return;
    // log(pickedfile.path.toString());
    update();
  }

  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final id = await studentDB.add(value);

    final idData = StudentModel(
        id: id,
        name: value.name,
        no: value.no,
        age: value.age,
        classroom: value.classroom,
        imgurl: value.imgurl);
    await studentDB.put(id, idData);

    list.add(idData);
    update();
  }

  deleteStudent(int index) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');

    studentDB.delete(index);
    list.removeAt(index);
    update();
    print(index.toString());
  }

  updateStudent(StudentModel editStudent, int index) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');

    await studentDB.put(list[index].id, editStudent);
    list.removeAt(index);
    list.insert(index, editStudent);
    update();
  }

  // Future<void> getAllStudents() async {
  //   final studentDB = await Hive.openBox<StudentModel>('student_db');

  //   addedstudentlist.addAll(studentDB.values);
  //   // log(addedstudentlist[0].age);
  // }

  // Future<void> deletestudent(index) async {
  //   final studentDB = await Hive.openBox<StudentModel>('student_db');
  //   studentDB.deleteAt(index);
  //   getAllStudents(index);
  //   update();
  // }

  // Future<void> editstudent(index, value) async {
  //   final studentDB = await Hive.openBox<StudentModel>('student_db');
  //   studentDB.putAt(index, value);
  //   getAllStudents(index);
  //   update();
  // }
}
