import 'package:flutter/material.dart';
import 'package:studentrecordbook/core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Text(
                    'DHSS HOSDURG',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 204, 0),
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'STUDENTS RECORD',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const Divider(
                height: 20,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              SizedBox(
                height: 50,

                child: ElevatedButton.icon(
                   style:
                        ElevatedButton.styleFrom(backgroundColor: kyellowcolor),
                    onPressed: () {
                      Navigator.of(context).pushNamed('screen_3');
                    },
                    icon: const Icon(Icons.remove_red_eye, color: kblackcolor),
                    label: const Text(
                      "View Students List",
                      style: TextStyle(fontSize: 20,color: kblackcolor),
                    )),
              ),
              const Divider(
                height: 20,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              SizedBox(
                  height: 50,
                  // color: Color.fromARGB(255, 132, 166, 195),
                  child: ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: kyellowcolor),
                    onPressed: () {
                      Navigator.of(context).pushNamed('screen_2');
                    },
                    label: const Text(
                      "Add Students",
                      style: TextStyle(fontSize: 20,color: kblackcolor),
                    ),
                    icon: Icon(Icons.add,color: kblackcolor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
