
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentrecordbook/Screens/HomeScreen.dart';
import 'package:studentrecordbook/Screens/dataScreen.dart';
import 'package:studentrecordbook/core/core.dart';
import 'package:studentrecordbook/db/controller/getxcontroller.dart';
import 'package:studentrecordbook/db/functions/db_functions.dart';
import 'package:studentrecordbook/db/model/data_model.dart';
import 'package:studentrecordbook/widget/widgetlist.dart';
import 'package:image_picker/image_picker.dart';

class EntryScreen extends StatelessWidget {
  EntryScreen({super.key});

  final getcontroller = Get.put(studentgetxController());

  final controller = Get.put(studentgetxController());

  final _nameControler = TextEditingController();

  final _noControler = TextEditingController();

  final _classControler = TextEditingController();

  final _ageControler = TextEditingController();

  final _bloodControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // getAllStudents();
    return Scaffold(
      backgroundColor: kblackcolor,
      appBar: AppBar(
        foregroundColor: kblackcolor,
        backgroundColor: kyellowcolor,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DataScreen(index: null.toString()),
                ));
              },
              child: const Text(
                'View List',
                style: TextStyle(color: kblackcolor, fontSize: 22),
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: GetBuilder<studentgetxController>(builder: (data) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  child: Column(children: [
                const Text('Enter Details Of Student',
                    style: TextStyle(
                        fontSize: 22, letterSpacing: 1, color: kwhitecolor)),
                const Divider(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: data.imageurl?.path.toString() == null
                            ? NetworkImage(
                                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png')
                                as ImageProvider
                            : FileImage(
                                File(
                                  data.imageurl!.path.toString(),
                                ),
                              ),
                      ),
                      color: const Color.fromARGB(255, 77, 77, 77),
                      borderRadius: BorderRadius.circular(20)),
                  height: 100,
                  width: 150,
                ),
                const Divider(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(color: kwhitecolor),
                  controller: _noControler,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kwhitecolor, style: BorderStyle.solid)),
                      hintText: 'Enter Roll Number  ',
                      hintStyle: TextStyle(color: kwhitecolor)),
                ),
                const Divider(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: kwhitecolor),
                  keyboardType: TextInputType.name,
                  controller: _nameControler,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kwhitecolor, style: BorderStyle.solid)),
                      hintText: 'Enter Name  ',
                      hintStyle: TextStyle(color: kwhitecolor)),
                ),
                const Divider(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: kwhitecolor),
                  keyboardType: TextInputType.number,
                  controller: _classControler,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kwhitecolor, style: BorderStyle.solid)),
                      hintText: 'Enter Class ',
                      hintStyle: TextStyle(color: kwhitecolor)),
                ),
                const Divider(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: kwhitecolor),
                  keyboardType: TextInputType.number,
                  controller: _ageControler,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kwhitecolor, style: BorderStyle.solid)),
                      hintText: 'Enter Age  ',
                      hintStyle: TextStyle(color: kwhitecolor)),
                ),
                const Divider(
                  height: 10,
                  // color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'Upload Photo Of Student',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: kwhitecolor),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      data.picmarketimagefromGallery();
                    },
                    color: kyellowcolor,
                  ),
                ),
                const Divider(
                  height: 30,
                  // color: Colors.white,
                ),
                Container(
                    height: 50,
                    width: 400,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kyellowcolor),
                        onPressed: () {
                          onAddStudentClicked();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        },
                        icon: const Icon(Icons.check, color: kblackcolor),
                        label: const Text(
                          'Submit',
                          style: TextStyle(color: kblackcolor, fontSize: 22),
                        ))),
              ])),
            ),
            // Expanded(child: ListStudentWidget())
          ],
        );
      }),
    );
  }

  Future<void> onAddStudentClicked() async {
    final no = _noControler.text;
    final name = _nameControler.text;
    final classroom = _classControler.text;
    final age = _ageControler.text;
    final imgurl = controller.imageurl!.path.toString();

    if (name.isEmpty || no.isEmpty || classroom.isEmpty || age.isEmpty) {
      return;
    }
    // print('$no , $name, $age. $classroom, $imageurl ');

    final _student = StudentModel(
      name: name,
      no: no,
      age: age,
      classroom: classroom,
      imgurl: imgurl,
    );

    getcontroller.addStudent(_student);
    // log(imgurl);
    // log(_student.toString());
  }
}
