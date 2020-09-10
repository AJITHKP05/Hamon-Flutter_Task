import 'package:HamonFlutterTask/mock/bloc/classAssign/classAssign_Bloc.dart'
    as classAssign;
import 'package:HamonFlutterTask/mock/bloc/classroom/classroom_Bloc.dart'
    as classroom;
import 'package:HamonFlutterTask/mock/bloc/student/student_Bloc.dart'
    as student;
import 'package:HamonFlutterTask/mock/bloc/subject/subject_Bloc.dart'
    as subject;
import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:HamonFlutterTask/mock/models/subject.dart';
import 'package:HamonFlutterTask/presentation/pages/classroomView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignPage extends StatefulWidget {
  @override
  _AssignPageState createState() => _AssignPageState();
}

class _AssignPageState extends State<AssignPage> {
  Widget studentHome = CircularProgressIndicator();
  Widget subjectHome = CircularProgressIndicator();
  Widget classroomHome = CircularProgressIndicator();
  Widget classAssignHome = LinearProgressIndicator();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return MultiBlocListener(
      listeners: [
        BlocListener<student.Studentsbloc, student.StudentListState>(
          listener: (context, state) {
            if (state is student.DataState) {
              studentHome = studentView(state.list);
            }
            if (state is student.NoDataEvent)
              studentHome = Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              );
          },
        ),
        BlocListener<subject.Subjectsbloc, subject.SubjectState>(
          listener: (context, state) {
            if (state is subject.DataState) {
              subjectHome = subjectView(state.list);
            }
            if (state is subject.NoDataEvent)
              subjectHome = CircularProgressIndicator();
          },
        ),
        BlocListener<classroom.Classroombloc, classroom.ClassroomState>(
          listener: (context, state) {
            if (state is classroom.DataState) {
              classroomHome = classroomView(state.list);
            }
            if (state is classroom.NoDataEvent)
              classroomHome = LinearProgressIndicator();
          },
        ),
        // BlocListener<classAssign.ClassAssignbloc, classAssign.ClassAssignState>(
        //   listener: (context, state) {
        //     if (state is classAssign.DataState) {
        //       classAssignHome = classAssignView(state.room);
        //     }
        //     if (state is classAssign.NoDataEvent)
        //       classAssignHome = CircularProgressIndicator();
        //   },
        // )
      ],
      child: BlocBuilder<student.Studentsbloc, student.StudentListState>(
          builder: (BuildContext context, state) {
        if (state is student.NoDataState) {
          final studentBloc = context.bloc<student.Studentsbloc>();
          // print("object");
          studentBloc.add(student.DataEvent());
        }
        return BlocBuilder<classroom.Classroombloc, classroom.ClassroomState>(
            builder: (BuildContext context, state) {
          if (state is classroom.NoDataState) {
            final classBloc = context.bloc<classroom.Classroombloc>();
            print("object");
            classBloc.add(classroom.DataEvent());
          }
          return BlocBuilder<subject.Subjectsbloc, subject.SubjectState>(
              builder: (BuildContext context, state) {
            if (state is subject.NoDataState) {
              final subBloc = context.bloc<subject.Subjectsbloc>();
              print("object");
              subBloc.add(subject.DataEvent());
            }
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Assign classRoom"),
              ),
              body: Container(
                  // color: Colors.grey,
                  // height: size.height,
                  child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Students List",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  studentHome,
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Subjects List",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  subjectHome,
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Classrooms",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .44,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(child: classroomHome),
                      ],
                    ),
                  ),
                ],
              )),
            );
          });
        });
      }),
    );
  }

  studentView(list) => Container(
        height: 91,
        child: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        // color: Colors.green,
                        width: 150,
                        child: Card(
                          color: Colors.green[300],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  list[index].name,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 20,
                                  child: Center(
                                    child: Draggable(
                                      feedback: Icon(
                                        Icons.person,
                                        size: 100,
                                        color: Colors.green,
                                      ),
                                      child: Text(
                                        "Drag",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        )),
                  ),
                ),
              )),
            ],
          ),
        ),
      );
  subjectView(list) => Container(
        height: 91,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
                child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      // color: Colors.green,
                      width: 150,
                      height: 70,
                      child: Card(
                        color: Colors.orange,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                list[index].name,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                color: Colors.black,
                                width: 150,
                                height: 20,
                                child: Center(
                                  child: Draggable(
                                    maxSimultaneousDrags: 1,
                                    data: Subject,
                                    feedback: Icon(
                                      Icons.article,
                                      size: 80,
                                      color: Colors.orange,
                                    ),
                                    child: Text(
                                      "Drag",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
                ),
              ),
            )),
          ],
        ),
      );
  classroomView(list) => ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) => BlocProvider(
            create: (BuildContext context) => classAssign.ClassAssignbloc(),
            child: Builder(
              builder: (BuildContext context) => BlocListener<
                  classAssign.ClassAssignbloc, classAssign.ClassAssignState>(
                listener: (BuildContext context, state) {
                  if (state is classAssign.NoDataState) {}
                },
                child: BlocBuilder<classAssign.ClassAssignbloc,
                        classAssign.ClassAssignState>(
                    builder: (BuildContext context, state) {
                  final roomBloc = context.bloc<classAssign.ClassAssignbloc>();
                  if (state is classAssign.NoDataState) {
                    print("No $index    data state");
                    roomBloc.add(classAssign.NoDataEvent(list[index]));
                  }
                  if (state is classAssign.DataState) {
                    print(state.room.name);
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ClassroomView(roomBloc.getRoom())));
                      },
                      child: Container(
                        color: Colors.blue[100],
                        // height: 300,
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              roomBloc.getRoom().name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(roomBloc.classroom.layout),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 120,
                              height: 90,
                              color: Colors.red[300],
                              child: roomBloc.getRoom().subject == null
                                  ? Center(child: Text("Drag a Subject"))
                                  : Center(
                                      child: Text(
                                          roomBloc.getRoom().subject.name)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 120,
                              height: 90,
                              color: Colors.orange[200],
                              child: (roomBloc.getRoom().students == null ||
                                      roomBloc.getRoom().size >
                                          roomBloc.getRoom().students.length)
                                  ? Center(child: Text("Drag a Students"))
                                  : Center(child: Text("Classromm if Full")),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 120,
                              height: 30,
                              color: Colors.greenAccent[200],
                              child: (roomBloc.getRoom().students == null ||
                                      roomBloc.getRoom().students.length == 0)
                                  ? Center(child: Text("View Students"))
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ));
  classAssignView(room) {}
}
