import 'package:HamonFlutterTask/mock/bloc/classAssign/classAssign_Bloc.dart'
    as classAssign;
import 'package:HamonFlutterTask/mock/bloc/classroom/classroom_Bloc.dart'
    as classroom;
import 'package:HamonFlutterTask/mock/bloc/student/student_Bloc.dart'
    as student;
import 'package:HamonFlutterTask/mock/bloc/subject/subject_Bloc.dart'
    as subject;
import 'package:HamonFlutterTask/mock/models/classroom.dart';
import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:HamonFlutterTask/mock/models/subject.dart';
import 'package:HamonFlutterTask/presentation/pages/classroomDetails.dart';
import 'package:HamonFlutterTask/presentation/pages/classroomView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                          color: Colors.orange,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      list[index].name,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
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
                                      data: list[index],
                                      feedback: Icon(
                                        Icons.person,
                                        size: 100,
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
                        color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  list[index].name,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
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
                                    data: list[index],
                                    feedback: Icon(
                                      Icons.article,
                                      size: 80,
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
      );
  classroomView(list) {
    Color subColor = Colors.green[200];
    Color stuColor = Colors.orange[200];
    Classroom classBack;
    return ListView.builder(
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
                    final roomBloc =
                        context.bloc<classAssign.ClassAssignbloc>();
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: Colors.blue[400],
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  roomBloc.classroom.layout,
                                  style: TextStyle(
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                DragTarget(
                                  builder: (BuildContext context,
                                      List<dynamic> candidateData,
                                      List<dynamic> rejectedData) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 120,
                                        height: 90,
                                        color: subColor,
                                        child: roomBloc.getRoom().subject ==
                                                null
                                            ? Center(
                                                child: Text("Drag a Subject"))
                                            : Center(
                                                child: Text(roomBloc
                                                    .getRoom()
                                                    .subject
                                                    .name)),
                                      ),
                                    );
                                  },
                                  onAccept: (data) {
                                    // print(data.name);
                                    if (data is Subject) {
                                      roomBloc.add(
                                          classAssign.SubjectAddEvent(data));
                                      setState(() {
                                        subColor = Colors.green[200];
                                      });
                                      getAlert(
                                          "${data.name} added to class ${roomBloc.getRoom().name}");
                                    }
                                  },
                                  onWillAccept: (data) {
                                    // print("off target");
                                    if (data is Subject) {
                                      // print("on target");
                                      setState(() {
                                        subColor = Colors.green;
                                      });

                                      return true;
                                    }
                                    setState(() {
                                      subColor = Colors.red;
                                    });
                                    return false;
                                  },
                                  onLeave: (data) {
                                    setState(() {
                                      subColor = Colors.green[200];
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DragTarget(
                                  builder: (BuildContext context,
                                      List<dynamic> candidateData,
                                      List<dynamic> rejectedData) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 120,
                                        height: 90,
                                        color: stuColor,
                                        child: (roomBloc.getRoom().students ==
                                                    null ||
                                                roomBloc
                                                        .getRoom()
                                                        .students
                                                        .length ==
                                                    0)
                                            ? Center(
                                                child: Text("Drag a Students"))
                                            : (roomBloc
                                                        .getRoom()
                                                        .students
                                                        .length <
                                                    roomBloc.getRoom().size)
                                                ? Container(
                                                    child: ListView(
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          child: Center(
                                                            child: Text(
                                                                "Students : ${roomBloc.getRoom().students.length}"),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Center(
                                                            child: Text(
                                                                "Max: ${roomBloc.getRoom().size}"),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    child: Center(
                                                      child: Text(
                                                          " Maximum Count (${roomBloc.getRoom().size}) reached"),
                                                    ),
                                                  ),
                                      ),
                                    );
                                  },
                                  onWillAccept: (data) {
                                    // print(data.name);
                                    if (data is Student) {
                                      if (roomBloc.getRoom().subject == null) {
                                        setState(() {
                                          stuColor = Colors.red;
                                        });
                                        getWarning("select a subject first");
                                        return false;
                                      }
                                      if (roomBloc.getRoom().students != null) {
                                        print("if block outside");
                                        if (roomBloc
                                                .getRoom()
                                                .students
                                                .length ==
                                            roomBloc.getRoom().size) {
                                          print("if block inside");
                                          setState(() {
                                            stuColor = Colors.red;
                                          });
                                          getWarning("The class is Full..!!!");
                                          return false;
                                        }
                                      }
                                      if (roomBloc.classroom.students != null &&
                                          roomBloc.classroom.students
                                              .contains(data)) {
                                        setState(() {
                                          stuColor = Colors.red;
                                        });
                                        getWarning(
                                            "He is already in class !!!");
                                        return false;
                                      }
                                      setState(() {
                                        stuColor = Colors.orange;
                                      });
                                      return true;
                                    }
                                    setState(() {
                                      stuColor = Colors.red;
                                    });
                                    return false;
                                  },
                                  onAccept: (data) {
                                    roomBloc
                                        .add(classAssign.StudentAddEvent(data));
                                    setState(() {
                                      stuColor = Colors.orange[300];
                                    });
                                    getAlert(
                                        "${data.name} added to class ${roomBloc.getRoom().name}");
                                  },
                                  onLeave: (data) {
                                    stuColor = Colors.orange[300];
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ClassroomDetails(roomBloc.getRoom(),
                                                (Classroom classroom) {
                                          setState(() {
                                            classBack = classroom;
                                          });
                                          roomBloc.add(classAssign.NoDataEvent(
                                              classBack));
                                        }),
                                      )),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 120,
                                      height: 30,
                                      color: Colors.black,
                                      child: Center(
                                          child: Text(
                                        "Classroom Details",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ));
  }

  classAssignView(room) {}

  getWarning(msg) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);

  getAlert(msg) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.black,
      fontSize: 16.0);
}
