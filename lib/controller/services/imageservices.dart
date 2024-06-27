import 'package:dio/dio.dart';
import 'package:hiringtask/model/photo_model.dart';

class PhotoRepo {
  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> fetchPhotos() async {
    try {
      final response = await _dio.get(_url);
      List<Photo> photos = (response.data as List)
          .map((photoJson) => Photo.fromJson(photoJson))
          .toList();
      return photos;
    } catch (e) {
      throw Exception('Failed to load photos');
    }
  }
}
