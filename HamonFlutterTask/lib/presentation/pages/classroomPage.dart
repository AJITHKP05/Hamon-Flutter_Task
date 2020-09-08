import 'package:HamonFlutterTask/mock/models/classroom.dart';
import 'package:flutter/material.dart';

class ClassroomPage extends StatelessWidget {
  final Classroom room;
  ClassroomPage(this.room);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              room.name.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildField(room.id, "ID"),
          buildField(room.layout, "Layout"),
          buildField(room.size, "Size")
        ],
      ),
    );
  }

  Widget buildField(name, hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: TextField(
        readOnly: true,
        controller: TextEditingController(text: "$name"),
        decoration: InputDecoration(
            labelText: '$hint ',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(100))),
      ),
    );
  }
}
