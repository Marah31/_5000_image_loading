import 'package:dio/dio.dart';
import 'package:_5000_image_loading/domain/entity/page_entity.dart';
import 'package:_5000_image_loading/provider/image_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNotifier extends Notifier<PageEntity> {
  CancelToken? cancelToken;
  static const int _limit = 20;

  @override
  PageEntity build() {
    Future.microtask(() => fetchNextPage());
    return const PageEntity();
  }

  Future<void> fetchNextPage() async {
    if (state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final repository = ref.read(imageRepositoryProvider);
      
      final allPhotos = await repository.fetchPhotos();

      final startIndex = (state.page - 1) * _limit;
      if (startIndex >= allPhotos.length) {
        state = state.copyWith(isLoadingMore: false, hasMore: false);
        return;
      }

      final newItems = allPhotos.skip(startIndex).take(_limit).toList();

      state = state.copyWith(
        products: [...state.products, ...newItems],
        page: state.page + 1,
        isLoadingMore: false,
        hasMore: (startIndex + _limit) < allPhotos.length,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false);
    }
  }
}

final pageProvider = NotifierProvider<PageNotifier, PageEntity>(
  PageNotifier.new,
);