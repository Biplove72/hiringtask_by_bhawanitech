import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiringtask/controller/cubit/photostate.dart';
import 'package:hiringtask/controller/services/imageservices.dart';
import 'package:hiringtask/model/photo_model.dart';

class PhotoCubit extends Cubit<PhotoState> {
  final PhotoRepo photorepo;

  PhotoCubit(this.photorepo) : super(InitialState());

  Future getPhoto() async {
    emit(LoadaingState());

    try {
      List<Photo> response = await photorepo.fetchPhotos();
      emit(LoadedState(response));
    } catch (e) {
      emit(PhotoErrorState(e.toString()));
    }
  }
}
