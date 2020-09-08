part of 'subject_Bloc.dart';

@immutable
abstract class SubjectState {}

class NoDataState extends SubjectState {}

class LoadingState extends SubjectState {}

class DataState extends SubjectState {
  List list;
  DataState(this.list);
}
