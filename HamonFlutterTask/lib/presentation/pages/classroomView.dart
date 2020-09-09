import 'package:HamonFlutterTask/mock/models/classroom.dart';
import 'package:flutter/material.dart';

class ClassroomView extends StatelessWidget {
  final Classroom room;
  ClassroomView(this.room);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class - ${room.id} ${room.name}"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          buildField("${room.id}", "ID"),
          SizedBox(height: 10),
          buildField(room.name, "Class Name"),
          SizedBox(height: 10),
          buildField(room.layout, "Layout"),
          SizedBox(height: 10),
          buildField(room.subject == null ? "No Subject" : room.subject.name,
              "Subject"),
          SizedBox(height: 10),
          buildField(room.subject == null ? "No Teacher" : room.subject.teacher,
              "Teacher"),
          SizedBox(height: 10),
          buildField("${room.size}", "Maximum Count"),
          SizedBox(height: 10),
          buildField(room.students == null ? "0" : room.students.length,
              "Present Count"),
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
