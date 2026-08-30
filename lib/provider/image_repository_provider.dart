import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/entity/image_entity.dart';
import '../repository/image_repository.dart';

final imageRepositoryProvider = Provider<ImageRepository>((ref) {
  return ImageRepository();
});

class ImageListNotifier extends AsyncNotifier<List<ImageEntity>> {
  @override
  Future<List<ImageEntity>> build() async {
    return _fetch5kPhotos();
  }

  Future<List<ImageEntity>> _fetch5kPhotos() async {
    final repository = ref.read(imageRepositoryProvider);
    return await repository.fetchPhotos();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetch5kPhotos());
  }
}

final imageListNotifierProvider =
    AsyncNotifierProvider<ImageListNotifier, List<ImageEntity>>(
  ImageListNotifier.new,
);