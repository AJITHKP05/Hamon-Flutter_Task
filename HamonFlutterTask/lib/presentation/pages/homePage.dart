import 'package:HamonFlutterTask/mock/bloc/classAssign/classAssign_Bloc.dart';
import 'package:HamonFlutterTask/mock/bloc/classroom/classroom_Bloc.dart';
import 'package:HamonFlutterTask/mock/bloc/student/student_Bloc.dart';
import 'package:HamonFlutterTask/mock/bloc/subject/subject_Bloc.dart';
import 'package:HamonFlutterTask/presentation/pages/assignPage.dart';
import 'package:HamonFlutterTask/presentation/pages/classroomList.dart';
import 'package:HamonFlutterTask/presentation/pages/studentsList.dart';
import 'package:HamonFlutterTask/presentation/pages/subjectList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("CLASSROOM MANAGER"),
        ),
        resizeToAvoidBottomPadding: true,
        body: Wrap(
          children: [
            getBox(context, "Students"),
            getBox(context, "Subjects"),
            getBox(context, "ClassRooms"),
            getBox(context, "Assign")
          ],
        ));
  }

  getBox(context, text) => Container(
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
            color: Colors.green,
            onPressed: () {
              if (text == "Students") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (BuildContext context) => Studentsbloc(),
                          child: StudentsListPage()),
                    ));
              }
              if (text == "Subjects") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubjectListPage(),
                    ));
              }
              if (text == "ClassRooms") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (BuildContext context) => Classroombloc(),
                          child: ClassroomList()),
                    ));
              }
              if (text == "Assign") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(providers: [
                        BlocProvider(
                          create: (context) => Studentsbloc(),
                        ),
                        BlocProvider(
                          create: (context) => Subjectsbloc(),
                        ),
                        BlocProvider(
                          create: (context) => Classroombloc(),
                        ),
                        // BlocProvider(
                        //   create: (context) => ClassAssignbloc(),
                        // )
                      ], child: AssignPage()),
                    ));
              }
            },
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            )),
      ));
}
