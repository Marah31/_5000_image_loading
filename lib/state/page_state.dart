// import 'package:dio/dio.dart';
// import 'package:_5000_image_loading/domain/entity/image_entity.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../domain/entity/page_entity.dart';

// class PageNotifier extends Notifier<PageEntity> {
//   String _currentQuery = '';
//   CancelToken? cancelToken;

//   @override
//   PageEntity build() {
//     Future.microtask(() => fetchNextPage(cancelToken));
//     return PageEntity();
//   }

//   Future<void> fetchNextPage(CancelToken? cancelToken) async {
//     if (state.isLoadingMore || !state.hasMore) return;

//     state = state.copyWith(isLoadingMore: true);

//     try {
//       final repository = ref.read(productRepositoryProvider);
//       final newItems = await repository.getProducts(
//         page: state.page,
//         limit: 20,
//         searchQuery: _currentQuery,
//         cancelToken: cancelToken,
//       );

//       state = state.copyWith(
//         products: [...state.products, ...newItems],
//         page: state.page + 1,
//         isLoadingMore: false,
//         hasMore: newItems.length == 20,
//       );
//     } catch (e) {
//       state = state.copyWith(isLoadingMore: false);
//     }
//   }
// }


// final pageProvider = NotifierProvider<PageNotifier, PageEntity>(
//   PageNotifier.new,
// );
