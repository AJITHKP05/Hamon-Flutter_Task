part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerState {}

class NoImageSelectedState extends ImagePickerState {}

class ImageSelectedState extends ImagePickerState {
  final PickedFile image;
  ImageSelectedState({this.image});
}
