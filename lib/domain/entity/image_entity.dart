import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_entity.freezed.dart';

@freezed
abstract class ImageEntity with _$ImageEntity {
  const factory ImageEntity({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = _ImageEntity;

  const ImageEntity._();
}
