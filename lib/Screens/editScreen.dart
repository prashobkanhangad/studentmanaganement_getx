import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentrecordbook/Screens/dataScreen.dart';
import 'package:studentrecordbook/core/core.dart';
import 'package:studentrecordbook/db/controller/getxcontroller.dart';
import 'package:studentrecordbook/db/functions/db_functions.dart';
import 'package:studentrecordbook/db/model/data_model.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatelessWidget {
  final controller = Get.put(studentgetxController());

  final String name;
  final String no;

  final String classroom;

  final String age;
  final String imgurl;
  final int id;

  EditScreen(
      {super.key,
      required this.age,
      required this.classroom,
      required this.imgurl,
      required this.name,
      required this.no,
      required this.id});

  XFile? imageurl;

  final _nameControler = TextEditingController();

  final _noControler = TextEditingController();

  final _classControler = TextEditingController();

  final _ageControler = TextEditingController();

  // final _bloodControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // getAllStudents();

    _nameControler.text = name;
    _ageControler.text = age;
    _noControler.text = no;
    _classControler.text = classroom;

    // log(widget.imgurl);

    return Scaffold(
      backgroundColor: kblackcolor,
      appBar: AppBar(
        foregroundColor: kblackcolor,
        backgroundColor: kyellowcolor,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DataScreen(
                    index: id.toString(),
                  ),
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
      body: ListView(
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
                        image: imageurl?.path.toString() == null
                            ? FileImage(
                                File(
                                  imgurl,
                                ),
                              )
                            : FileImage(
                                File(
                                  imageurl!.path.toString(),
                                ),
                              )),
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
                    picmarketimagefromGallery();
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
                          builder: (context) => DataScreen(
                            index: id.toString(),
                          ),
                        ));
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
      ),
    );
  }

  Future<void> onAddStudentClicked() async {
    final no = _nameControler.text;
    final name = _nameControler.text;
    final classroom = _classControler.text;
    final age = _ageControler.text;
    final imgurl = imageurl!.path.toString();

    if (name.isEmpty || no.isEmpty || classroom.isEmpty || age.isEmpty) {
      return;
    }
    print('$no , $name, $age. $classroom, $imageurl ');

    final _student = StudentModel(
        name: name, no: no, age: age, classroom: classroom, imgurl: imgurl);

    controller.updateStudent(_student, id);
  }

  Future<void> picmarketimagefromGallery() async {
    XFile? pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    imageurl = pickedfile;

    if (pickedfile == null) return;
    // log(pickedfile.path.toString());
  }
}
