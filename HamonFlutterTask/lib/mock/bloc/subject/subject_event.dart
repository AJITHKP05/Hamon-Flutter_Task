part of 'subject_Bloc.dart';

@immutable
abstract class SubjectEvent {}

class NoDataEvent extends SubjectEvent {}

class LoadingEvent extends SubjectEvent {}

class DataEvent extends SubjectEvent {}
