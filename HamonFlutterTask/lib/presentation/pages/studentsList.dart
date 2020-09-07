import 'package:HamonFlutterTask/mock/bloc/student_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsListPage extends StatefulWidget {
  @override
  _StudentsListPageState createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  @override
  Widget build(BuildContext context) {
    Widget home = CircularProgressIndicator();
    return BlocProvider(
      create: (BuildContext context) => Studentsbloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Students List"),
        ),
        body: Builder(
          builder: (BuildContext context) =>
              BlocListener<Studentsbloc, StudentListState>(
            listener: (context, state) {
              if (state is DataState) {
                home = Text("data");
                // print("done");
              }
              if (state is NoDataEvent) home = CircularProgressIndicator();
            },
            child: BlocBuilder<Studentsbloc, StudentListState>(
              builder: (context, state) {
                if (state is NoDataState) {
                  final studentBloc = context.bloc<Studentsbloc>();
                  print("object");
                  studentBloc.add(DataEvent());
                }
                return Container(child: Center(child: home));
              },
            ),
          ),
        ),
      ),
    );
  }
}
