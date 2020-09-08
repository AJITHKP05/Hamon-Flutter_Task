import 'dart:convert';

import 'package:HamonFlutterTask/mock/models/classroom.dart';
import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
part 'classroom_event.dart';
part 'classroom_state.dart';

class Classroombloc extends Bloc<ClassroomEvent, ClassroomState> {
  Classroombloc() : super(NoDataState());
  String url =
      "https://hamon-interviewapi.herokuapp.com//classrooms/?api_key=cAaf9";
  List classroomList;
  @override
  Stream<ClassroomState> mapEventToState(ClassroomEvent event) async* {
    if (event is NoDataEvent) yield NoDataState();
    if (event is DataEvent) {
      yield LoadingState();
      print("data event");
      Response res = await getData();
      print(res.statusCode);

      getList(res);

      yield DataState(classroomList);
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
    classroomList = json
        .decode(res.body)['classrooms']
        .map((data) => Classroom.fromJson(data))
        .toList();

    print(classroomList.length);
  }
}
