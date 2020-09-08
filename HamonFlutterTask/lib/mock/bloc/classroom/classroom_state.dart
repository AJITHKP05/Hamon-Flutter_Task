part of 'classroom_Bloc.dart';

@immutable
abstract class ClassroomState {}

class NoDataState extends ClassroomState {}

class LoadingState extends ClassroomState {}

class DataState extends ClassroomState {
  List list;
  DataState(this.list);
}
