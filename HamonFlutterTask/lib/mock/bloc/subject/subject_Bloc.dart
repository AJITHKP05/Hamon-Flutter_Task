import 'dart:convert';

import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:HamonFlutterTask/mock/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
part 'subject_event.dart';
part 'subject_state.dart';

class Subjectsbloc extends Bloc<SubjectEvent, SubjectState> {
  Subjectsbloc() : super(NoDataState());
  String url =
      "https://hamon-interviewapi.herokuapp.com//subjects/?api_key=cAaf9";
  List subjectList;
  @override
  Stream<SubjectState> mapEventToState(SubjectEvent event) async* {
    if (event is NoDataEvent) yield NoDataState();
    if (event is DataEvent) {
      yield LoadingState();
      print("data event");
      Response res = await getData();
      print(res.statusCode);

      getList(res);

      yield DataState(subjectList);
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
    subjectList = json
        .decode(res.body)['subjects']
        .map((data) => Subject.fromJson(data))
        .toList();

    print(subjectList.length);
  }
}
