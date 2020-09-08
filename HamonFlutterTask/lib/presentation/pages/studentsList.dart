import 'package:HamonFlutterTask/mock/bloc/image_picker/image_picker_bloc.dart';
import 'package:HamonFlutterTask/mock/bloc/student/student_Bloc.dart';
import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:HamonFlutterTask/presentation/pages/studentPage.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Students List"),
      ),
      body: BlocListener<Studentsbloc, StudentListState>(
        listener: (context, state) {
          if (state is DataState) {
            // home = Text("data");
            // print("done");
            home = viewData(state.list);
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
    );
  }

  viewData(list) {
    print(list.last.name);

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: Colors.green,
          leading: Text("${list[index].id}",
              style: TextStyle(
                fontSize: 18,
              )),
          title: Text(
            "${list[index].name}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                      create: (BuildContext context) => ImagePickerBloc(),
                      child: StudentPage(list[index])),
                ));
          },
        ),
      ),
    );
  }
}
