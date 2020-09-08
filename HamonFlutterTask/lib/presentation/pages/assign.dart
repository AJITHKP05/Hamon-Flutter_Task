import 'package:flutter/material.dart';

class AssignPage extends StatefulWidget {
  @override
  _AssignPageState createState() => _AssignPageState();
}

class _AssignPageState extends State<AssignPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color teacher = Colors.grey;
    Color student = Colors.white;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Assign classRoom"),
      ),
      body: Container(
          // color: Colors.grey,
          height: size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Expanded(
                    child: Container(
                      color: teacher,
                      // width: size.width * .3,
                      child: FlatButton(
                          onPressed: () {
                            setState(() {
                              Color teacher = Colors.white;
                              Color student = Colors.grey;
                            });
                            // print(buttonColor);
                          },
                          child: Text("View Teachers")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: student,
                      // width: size.width * .3,
                      child: FlatButton(
                          onPressed: () {
                            setState(() {
                              Color teacher = Colors.grey;
                              Color student = Colors.white;
                            });
                            // print(buttonColor);
                          },
                          child: Text(
                            "View Students",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
