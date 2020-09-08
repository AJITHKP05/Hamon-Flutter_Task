import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatelessWidget {
  final Student student;
  StudentPage(this.student);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          buildPic(),
          SizedBox(
            height: 20,
          ),
          Text(
            student.name.toUpperCase(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          buildField(student.id, "id"),
          buildField(student.age, "age"),
          buildField(student.email, "email"),
        ],
      ),
    );
  }

  Widget buildPic() {
    return Center(
      child: Stack(overflow: Overflow.visible, children: <Widget>[
        CircleAvatar(
          //padding: const EdgeInsets.all(8.0),
          radius: 71,
          backgroundColor: Colors.orange,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: AssetImage("assets/contact.png"),
            radius: 70,
          ),
        ),

        //SizedBox(height: 20, width: 100),
      ]),
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
