import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentrecordbook/core/core.dart';

class DataInsideScreen extends StatelessWidget {
  final String name;
  final String no;

  final String classroom;

  final String age;

  final String imgurl;

  const DataInsideScreen(
      {super.key,
      required this.age,
      required this.classroom,
      required this.imgurl,
      required this.name,
      required this.no});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kyellowcolor,
        foregroundColor: kblackcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(
                    File(imgurl),
                  ),
                ),
                color: const Color.fromARGB(255, 77, 77, 77),
                borderRadius: BorderRadius.circular(20)),
            height: 200,
            width: double.maxFinite,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Name: $name',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Roll No: $no', style: const TextStyle(fontSize: 21)),
          const SizedBox(
            height: 10,
          ),
          Text('Class: $classroom', style: const TextStyle(fontSize: 21)),
          const SizedBox(
            height: 10,
          ),
          Text('Age: $age', style: const TextStyle(fontSize: 21)),
        ]),
      ),
    );
  }
}
