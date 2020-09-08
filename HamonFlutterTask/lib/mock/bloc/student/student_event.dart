part of "student_Bloc.dart";

@immutable
abstract class StudentEvent {}

class NoDataEvent extends StudentEvent {}

class LoadingEvent extends StudentEvent {}

class DataEvent extends StudentEvent {}
