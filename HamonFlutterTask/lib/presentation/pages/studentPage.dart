import 'dart:io';

import 'package:HamonFlutterTask/mock/bloc/image_picker/image_picker_bloc.dart';
import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class StudentPage extends StatelessWidget {
  final Student student;
  StudentPage(this.student);
  File _image;
  bool imageView = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ImagePickerBloc, ImagePickerState>(
      listener: (BuildContext context, state) {
        if (state is ImageSelectedState) {
          _image = (File(state.image.path));
          imageView = true;
        }
      },
      child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
        final imageBloc = context.bloc<ImagePickerBloc>();
        imageBloc.add(NoImageSelectedEvent());
        return Scaffold(
          appBar: AppBar(
            title: Text(student.name),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Stack(overflow: Overflow.visible, children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      //padding: const EdgeInsets.all(8.0),
                      radius: 71,
                      backgroundColor: Colors.orange,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: imageView
                            ? FileImage(_image)
                            : AssetImage("assets/contact.png"),
                        radius: 70,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        iconSize: 40,
                        icon: Icon(Icons.camera_alt),
                        color: Colors.black,
                        onPressed: () {
                          imageBloc.add(
                              ImageSelectedEvent(source: ImageSource.camera));
                        },
                      ))

                  //SizedBox(height: 20, width: 100),
                ]),
              ),
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
      }),
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
