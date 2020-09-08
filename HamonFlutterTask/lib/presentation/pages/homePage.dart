import 'package:HamonFlutterTask/presentation/pages/studentsList.dart';
import 'package:HamonFlutterTask/presentation/pages/subjectList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CLASSROOM MANAGER"),
        ),
        resizeToAvoidBottomPadding: true,
        body: Wrap(
          children: [
            Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 5,
                child: FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentsListPage(),
                          ));
                    },
                    child: Text(
                      "Students",
                      style: TextStyle(color: Colors.white),
                    ))),
            Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 5,
                child: FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubjectListPage(),
                          ));
                    },
                    child: Text(
                      "Subjects",
                      style: TextStyle(color: Colors.white),
                    ))),
            Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 5,
                child: FlatButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      "Classrooms",
                      style: TextStyle(color: Colors.white),
                    ))),
            Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 5,
                child: FlatButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      "Extra",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ));
  }
}
