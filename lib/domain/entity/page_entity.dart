import 'package:_5000_image_loading/domain/entity/image_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'page_entity.freezed.dart';

@freezed
abstract class PageEntity with _$PageEntity {

  const factory PageEntity({
    @Default([]) List<ImageEntity> products,
    @Default(1) int page,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
    @Default(false) bool forceFavoriteFailure,
  }) = _PageEntity;

  const PageEntity._();
}
