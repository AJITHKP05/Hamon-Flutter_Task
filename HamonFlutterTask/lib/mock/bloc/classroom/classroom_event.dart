part of 'classroom_Bloc.dart';

@immutable
abstract class ClassroomEvent {}

class NoDataEvent extends ClassroomEvent {}

class LoadingEvent extends ClassroomEvent {}

class DataEvent extends ClassroomEvent {}
