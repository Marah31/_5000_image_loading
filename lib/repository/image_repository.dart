import 'package:dio/dio.dart';
import '../domain/entity/image_entity.dart'; 

class ImageRepository {
  final Dio _dio;

  ImageRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<ImageEntity>> fetchPhotos() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/photos');
      
      final List<dynamic> data = response.data;
      
      return data.map((json) {
        return ImageEntity(
          albumId: json['albumId'] as int,
          id: json['id'] as int,
          title: json['title'] as String,
          url: json['url'] as String,
          thumbnailUrl: json['thumbnailUrl'] as String,
        );
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}