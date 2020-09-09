part of 'classAssign_Bloc.dart';

@immutable
abstract class ClassAssignEvent {}

class NoDataEvent extends ClassAssignEvent {
  Classroom classroom;
  NoDataEvent(this.classroom);
}

class LoadingEvent extends ClassAssignEvent {}

class DataEvent extends ClassAssignEvent {}

class StudentAddEvent extends ClassAssignEvent {
  Student student;
  StudentAddEvent(this.student);
}

class StudentRemoveEvent extends ClassAssignEvent {
  Student student;
  StudentRemoveEvent(this.student);
}

class SubjectAddEvent extends ClassAssignEvent {
  Subject subject;
  SubjectAddEvent(this.subject);
}

class SubjectRemoveEvent extends ClassAssignEvent {}
