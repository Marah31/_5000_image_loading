import 'package:_5000_image_loading/provider/image_repository_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


const List<Color> _accentPalette = [
  Color(0xFFFF6B6B), 
  Color(0xFFFFA94D), 
  Color(0xFFFFD43B),
  Color(0xFF69DB7C),
  Color(0xFF4DABF7),
  Color(0xFF9775FA),
  Color(0xFFF783AC),
];

const Color _screenBackground = Color(0xFFF6F5FB);
const Color _cardBackground = Colors.white;

class PhotoListScreen extends ConsumerWidget {
  const PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosState = ref.watch(imageListNotifierProvider);

    return Scaffold(
      backgroundColor: _screenBackground,
      body: photosState.when(
        data: (photos) {
          return CustomScrollView(
            cacheExtent: 200,
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: false,
                elevation: 0,
                backgroundColor: const Color(0xFF6C5CE7),
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF6C5CE7),
                        Color(0xFF9B7BFF),
                        Color(0xFFB983FF),
                      ],
                    ),
                  ),
                  child: FlexibleSpaceBar(
                    titlePadding:
                        const EdgeInsets.only(left: 20, bottom: 16),
                    title: const Text(
                      '5000 Photos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                        color: Colors.white,
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          top: -40,
                          right: -30,
                          child: _DecorativeCircle(
                            size: 140,
                            color: Colors.white.withOpacity(0.08),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          left: -20,
                          child: _DecorativeCircle(
                            size: 100,
                            color: Colors.white.withOpacity(0.08),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final photo = photos[index];
                      const double cardWidth = 180;
                      const double imageSize = 140;
                      final imageDimension = imageSize.toInt();
                      final workingImageUrl =
                          'https://picsum.photos/seed/${photo.id}/$imageDimension/$imageDimension';

                      final accentColor =
                          _accentPalette[photo.id % _accentPalette.length];

                      return Center(
                        child: Container(
                          width: cardWidth,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: _cardBackground,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: accentColor.withOpacity(0.16),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: cardWidth,
                                    height: imageSize,
                                    color: accentColor.withOpacity(0.08),
                                    child: CachedNetworkImage(
                                      imageUrl: workingImageUrl,
                                      width: cardWidth,
                                      height: imageSize,
                                      fit: BoxFit.contain,
                                      memCacheHeight: imageDimension,
                                      memCacheWidth: imageDimension,
                                      placeholder: (context, url) =>
                                          Center(
                                        child: SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.2,
                                            color: accentColor,
                                          ),
                                        ),
                                      ),
                                      errorWidget:
                                          (context, url, error) => Center(
                                        child: Icon(
                                          Icons.image_not_supported_rounded,
                                          color: accentColor,
                                          size: 20,
                                        ),
                                      ),
                                      fadeInDuration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  ),
                                  Positioned(
                                    top: 6,
                                    left: 6,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 7,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.black.withOpacity(0.45),
                                        borderRadius:
                                            BorderRadius.circular(16),
                                      ),
                                      child: Text(
                                        '#${photo.id}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // ---- Info below ----
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: accentColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            'Item #${photo.id}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 13,
                                              letterSpacing: 0.1,
                                              color: Color(0xFF2D2A3E),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      photo.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 11,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: photos.length,
                    addAutomaticKeepAlives: false,
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFF6C5CE7)),
        ),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Error: $error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ),
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _DecorativeCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}