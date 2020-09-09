part of 'classAssign_Bloc.dart';

@immutable
abstract class ClassAssignState {}

class NoDataState extends ClassAssignState {}

class LoadingState extends ClassAssignState {}

class DataState extends ClassAssignState {
  Classroom room;
  DataState(this.room);
}

class DataAddState extends ClassAssignState {}

class DataRemoveState extends ClassAssignState {}
