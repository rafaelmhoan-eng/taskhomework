import 'package:flutter/material.dart';
import 'package:tasks_homework/models/containers_Screen.dart';

class StandartScreen extends StatefulWidget {
  const StandartScreen({super.key});

  @override
  State<StandartScreen> createState() => _StandartScreenState();
}

final _namecontroller = TextEditingController();

class _StandartScreenState extends State<StandartScreen> {
  List<String> words = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 103, 176),
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Icon(Icons.assignment_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text('My Tasks', style: TextStyle(color: Colors.white)),
            Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 240, 240),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16),

                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _namecontroller,
                        decoration: InputDecoration(
                          hintText: 'e.g., Buy groceries',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 223, 217, 217),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 196, 190, 190),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (_namecontroller.text.isNotEmpty &&
                              words.length < 15) {
                            setState(() {
                              words.add(_namecontroller.text);
                            });
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),

                            Text(
                              'Ավելացնել',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.add_circle),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: words.length,
              itemBuilder: (context, index) {
                return ContainersScreen(
                  text: words[index],
                  onDelate: () {
                    setState(() {
                      words.removeAt(index);
                    });
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
