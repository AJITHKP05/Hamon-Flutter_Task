import 'dart:convert';

import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
part 'student_event.dart';
part 'student_state.dart';

class Studentsbloc extends Bloc<StudentEvent, StudentListState> {
  Studentsbloc() : super(NoDataState());
  String url =
      "https://hamon-interviewapi.herokuapp.com//students/?api_key=cAaf9";
  List studentList;
  @override
  Stream<StudentListState> mapEventToState(StudentEvent event) async* {
    if (event is NoDataEvent) yield NoDataState();
    if (event is DataEvent) {
      yield LoadingState();
      print("data event");
      Response res = await getData();
      print(res.statusCode);

      getList(res);

      yield DataState(studentList);
    }
  }

  Future getData() async {
    Response response = await http.get(url);
    return response;
  }

  getList(Response res) {
    print(json.decode(res.body));
    // List response = json.decode(res.body);
    print("response");
    studentList = json
        .decode(res.body)['students']
        .map((data) => Student.fromJson(data))
        .toList();

    print(studentList.length);
  }
}
