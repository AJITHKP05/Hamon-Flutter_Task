import 'package:HamonFlutterTask/mock/bloc/classroom/classroom_Bloc.dart';
import 'package:HamonFlutterTask/presentation/pages/classroomPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget home = CircularProgressIndicator();
    return Scaffold(
      appBar: AppBar(
        title: Text("Classroom List"),
      ),
      body: BlocListener<Classroombloc, ClassroomState>(
        listener: (context, state) {
          if (state is DataState) {
            // home = Text("data");
            // print("done");
            home = viewData(state.list);
          }
          if (state is NoDataEvent) home = CircularProgressIndicator();
        },
        child: BlocBuilder<Classroombloc, ClassroomState>(
          builder: (context, state) {
            if (state is NoDataState) {
              final classBloc = context.bloc<Classroombloc>();
              print("object");
              classBloc.add(DataEvent());
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
                    builder: (context) => ClassroomPage(list[index])));
          },
        ),
      ),
    );
  }
}
