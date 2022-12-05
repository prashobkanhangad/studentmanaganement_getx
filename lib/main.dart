import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentrecordbook/Screens/dataScreen.dart';
import 'package:studentrecordbook/core/core.dart';
import 'package:studentrecordbook/db/model/data_model.dart';

import 'Screens/EntryScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(StudentRecord());
}

class StudentRecord extends StatelessWidget {
  const StudentRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentRecord',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: kblackcolor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: SplashScreen(),
      routes: {
        'screen_1': (ctx) {
          return HomeScreen();
        },
        'screen_2': (ctx) {
          return EntryScreen();
        },
        'screen_3': (ctx) {
          return DataScreen(index: null.toString(),);
        },
      },
    );
  }
}
