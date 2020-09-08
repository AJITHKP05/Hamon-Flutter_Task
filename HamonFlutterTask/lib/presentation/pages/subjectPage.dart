import 'package:HamonFlutterTask/mock/models/subject.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  final Subject sub;
  SubjectPage(this.sub);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sub.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              sub.name.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildField(sub.id, "ID"),
          buildField(sub.credits, "Credits"),
          buildField(sub.teacher, "Teacher")
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
