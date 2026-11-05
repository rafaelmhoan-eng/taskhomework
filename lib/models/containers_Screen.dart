import 'package:flutter/material.dart';

class ContainersScreen extends StatefulWidget {
  final String text;
  final VoidCallback onDelate;
  const ContainersScreen({
    super.key,
    required this.text,
    required this.onDelate,
  });

  @override
  State<ContainersScreen> createState() => _ContainersScreenState();
}

class _ContainersScreenState extends State<ContainersScreen> {
  bool isChacked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 68,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 198, 194, 194),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(
              widget.text,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Spacer(),
            IconButton(
              onPressed: widget.onDelate,
              icon: Icon(Icons.delete_sharp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
