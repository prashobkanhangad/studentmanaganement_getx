
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentrecordbook/Screens/datainsidescreen.dart';
import 'package:studentrecordbook/Screens/editScreen.dart';
import 'package:studentrecordbook/core/core.dart';
import 'package:studentrecordbook/db/controller/getxcontroller.dart';
import 'package:studentrecordbook/db/functions/db_functions.dart';
import '../db/model/data_model.dart';

class DataScreen extends StatelessWidget {
  final String index;
  final getcontroller = Get.put(studentgetxController());

  DataScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // getcontroller.getAllStudents(index);

    return Scaffold(
        appBar: AppBar(
          // actions: [],
          backgroundColor: kyellowcolor,
          foregroundColor: kblackcolor,
        ),
        body: GetBuilder<studentgetxController>(
            init: studentgetxController(),
            builder: (getxdata) {
              // log('home value check${getxdata.list.toString()}');

              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = getxdata.list[index];
                  // log(getxdata.list.toString());

                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DataInsideScreen(
                          age: data.age,
                          classroom: data.classroom,
                          imgurl: data.imgurl,
                          name: data.name,
                          no: data.no),
                    )),
                    child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            height: 65,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(data.imgurl),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(height: 10,),
                              Text(
                                'Name: ${data.name}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('Roll No: ${data.no}',
                                  style: const TextStyle(fontSize: 17)),
                              Text('Class: ${data.classroom}',
                                  style: const TextStyle(fontSize: 17)),
                              Text('Age: ${data.age}',
                                  style: const TextStyle(fontSize: 17)),
                            ],
                          ),
                          Spacer(),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () =>getcontroller.deleteStudent(index),
                                  child: Container(
                                    height: 35,
                                    width: 75,
                                    decoration: BoxDecoration(
                                        color: kyellowcolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Delete',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: kblackcolor),
                                        ),
                                        Icon(
                                          Icons.delete,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => EditScreen(
                                        age: data.age,
                                        classroom: data.classroom,
                                        imgurl: data.imgurl,
                                        name: data.name,
                                        no: data.no,
                                        id: index),
                                  )),
                                  child: Container(
                                    height: 35,
                                    width: 75,
                                    decoration: BoxDecoration(
                                        color: kyellowcolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text(
                                          'Edit',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: kblackcolor),
                                        ),
                                        Icon(Icons.edit, size: 16)
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider(
                    color: kyellowcolor,
                  );
                },
                itemCount: getxdata.list.length,
              );
            }));
  }
}
