import 'package:HamonFlutterTask/mock/bloc/classAssign/classAssign_Bloc.dart';
import 'package:HamonFlutterTask/mock/models/classroom.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomDetails extends StatefulWidget {
  final Classroom room;
  final ClassCallback callBackClass;
  ClassroomDetails(this.room, this.callBackClass);
  @override
  _ClassroomDetailsState createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.name),
        actions: [
          FlatButton(
              onPressed: () {
                widget.callBackClass(widget.room);
                Navigator.pop(context);
              },
              child: Text("save",
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              widget.room.subject == null
                  ? buildField("No Subject", "Subject")
                  : buildField(widget.room.subject.name, "Subject"),
              widget.room.subject == null
                  ? buildField("No Teacher", "Teacher")
                  : buildField(widget.room.subject.teacher, "Teacher"),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("Students",
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              widget.room.students == null
                  ? Center(
                      child: Text("No students "),
                    )
                  : viewData()
            ],
          )),
    );
  }

  Widget buildField(name, hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: TextField(
        readOnly: true,
        controller: TextEditingController(text: "$name"),
        decoration: InputDecoration(
            suffix: InkWell(
                onTap: () {
                  setState(() {
                    widget.room.subject = null;
                  });
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.black,
                )),
            labelText: '$hint ',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(100))),
      ),
    );
  }

  viewData() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.room.students.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: Colors.green,
          leading: Text("$index",
              style: TextStyle(
                fontSize: 18,
              )),
          title: Text(
            "${widget.room.students[index].name}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: InkWell(
              onTap: () {
                setState(() {
                  widget.room.students.removeAt(index);
                });
              },
              child: Icon(
                Icons.delete,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}

typedef ClassCallback = void Function(Classroom classroom);
