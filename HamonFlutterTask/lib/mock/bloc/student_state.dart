part of 'student_Bloc.dart';

@immutable
abstract class StudentListState {}

class NoDataState extends StudentListState {}

class LoadingState extends StudentListState {}

class DataState extends StudentListState {
  List list;
  DataState(this.list);
}
