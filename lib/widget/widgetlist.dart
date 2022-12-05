// import 'package:flutter/material.dart';

// import '../db/functions/db_functions.dart';
// import '../db/model/data_model.dart';

// class ListStudentWidget extends StatelessWidget {
//   const ListStudentWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: studentListNotifier,
//       builder:
//           (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
//         return ListView.separated(
//           itemBuilder: (ctx, index) {
//             final data = studentList[index];

//             return ListTile(
//               title: Text(data.name),
//               subtitle: Text(data.no),
//               // leading: Text(data.class1),
//               // trailing: Text(data.age),
//             );
//           },
//           separatorBuilder: (ctx, index) {
//             return const Divider();
//           },
//           itemCount: studentList.length,
//         );
//       },
//     );
//   }
// }
