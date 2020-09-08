import 'package:HamonFlutterTask/mock/bloc/image_picker/image_picker_bloc.dart';
// import 'package:HamonFlutterTask/mock/bloc/student/student_Bloc.dart';
import 'package:HamonFlutterTask/mock/bloc/subject/subject_Bloc.dart';
import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:HamonFlutterTask/presentation/pages/subjectPage.dart';
// import 'package:HamonFlutterTask/presentation/pages/studentPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget home = CircularProgressIndicator();
    return BlocProvider(
      create: (BuildContext context) => Subjectsbloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Subjects List"),
        ),
        body: Builder(
          builder: (BuildContext context) =>
              BlocListener<Subjectsbloc, SubjectState>(
            listener: (context, state) {
              if (state is DataState) {
                // home = Text("data");
                // print("done");
                home = viewData(state.list);
              }
              if (state is NoDataEvent) home = CircularProgressIndicator();
            },
            child: BlocBuilder<Subjectsbloc, SubjectState>(
              builder: (context, state) {
                if (state is NoDataState) {
                  final subBloc = context.bloc<Subjectsbloc>();
                  print("object");
                  subBloc.add(DataEvent());
                }
                return Container(child: Center(child: home));
              },
            ),
          ),
        ),
      ),
    );
  }

  viewData(list) {
    print(list.last);
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Text("${list[index].id}"),
          title: Text(
            "${list[index].name}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubjectPage(list[index]),
                ));
          },
        ),
      ),
    );
  }
}
