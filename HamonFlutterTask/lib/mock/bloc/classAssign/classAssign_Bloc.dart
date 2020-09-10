import 'dart:convert';

import 'package:HamonFlutterTask/mock/bloc/classroom/classroom_Bloc.dart';
import 'package:HamonFlutterTask/mock/models/classroom.dart';
import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:HamonFlutterTask/mock/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
part 'classAssign_event.dart';
part 'classAssign_state.dart';

class ClassAssignbloc extends Bloc<ClassAssignEvent, ClassAssignState> {
  ClassAssignbloc() : super(NoDataState());

  Classroom classroom = new Classroom(0, "name", 0, "layout");
  @override
  Stream<ClassAssignState> mapEventToState(ClassAssignEvent event) async* {
    if (event is NoDataEvent) {
      classroom = event.classroom;
      yield DataState(classroom);
    }
    if (event is StudentAddEvent) {
      if (classroom.students == null) {
        List<Student> list = [event.student];
        classroom.students = list;
      } else
        classroom.students.add(event.student);

      yield LoadingState();

      yield DataState(classroom);
    }
    if (event is StudentRemoveEvent) {
      classroom.students.remove(event.student);
      yield LoadingState();

      yield DataState(classroom);
    }
    if (event is SubjectAddEvent) {
      yield LoadingState();
      classroom.subject = event.subject;
      yield DataState(classroom);
    }
    if (event is SubjectRemoveEvent) {
      yield LoadingState();
      classroom.subject = null;
      yield DataState(classroom);
    }
  }

  Classroom getRoom() => classroom;
}
