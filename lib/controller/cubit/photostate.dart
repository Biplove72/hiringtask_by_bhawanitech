import 'package:hiringtask/model/photo_model.dart';

abstract class PhotoState {
  PhotoState();
}

class InitialState extends PhotoState {}

class LoadaingState extends PhotoState {}

class LoadedState extends PhotoState {
  final List<Photo> photo;
  LoadedState(this.photo);
}

class PhotoErrorState extends PhotoState {
  final String message;
  PhotoErrorState(this.message);
}
