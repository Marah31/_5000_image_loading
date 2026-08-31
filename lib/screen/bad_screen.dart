import 'dart:async';

import 'package:_5000_image_loading/performance_monitor.dart';
import 'package:flutter/material.dart';
import 'package:_5000_image_loading/domain/entity/image_entity.dart';

class OptimizedScreen extends StatefulWidget {
  final int screenNumber;
  final List<ImageEntity> photos;

  const OptimizedScreen({
    super.key,
    required this.screenNumber,
    required this.photos,
  });

  @override
  State<OptimizedScreen> createState() => _OptimizedScreenState();
}

class _OptimizedScreenState extends State<OptimizedScreen> {
  late final ScrollController _scrollController;
  Timer? _timer;
  Timer? _streamEventTimer;
  StreamController<String>? _streamController;

  StreamSubscription<String>? _subscription;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
      },
    );
    _streamController = StreamController<String>();

    _subscription = _streamController!.stream.listen(
      (message) {
        print(
          'STREAM RUNNING - '
          'Screen ${widget.screenNumber}: $message',
        );
      },
    );

    _streamEventTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) {
        if (_streamController != null && !_streamController!.isClosed) {
          _streamController?.add(
            'Event from screen ${widget.screenNumber}',
          );
        }
      },
    );
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      print(
          'Screen ${widget.screenNumber}: '
          '${_scrollController.position.pixels}',
        );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();

    _timer?.cancel();
    _streamEventTimer?.cancel();

    _subscription?.cancel();
    _streamController?.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Optimized Screen ${widget.screenNumber}',
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        cacheExtent: 500,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Optimized Screen ${widget.screenNumber}',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'this screen cleanly disposes all resources',
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Photos: ${widget.photos.length}',
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final photo = widget.photos[index];
                final imageUrl =
                    'https://picsum.photos/seed/'
                    '${photo.id}/800/800';

                return RepaintBoundary(
                  child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 3,
                        color: Colors.black12
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      children: [
                        Image.network(
                          imageUrl,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,

                          errorBuilder:
                              (context, error, stackTrace) {
                            return const SizedBox(
                              height: 250,
                              child: Center(
                                child: Icon(
                                  Icons.error,
                                  size: 50,
                                ),
                              ),
                            );
                          },
                        ),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            photo.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    )
                  ),
                );
              },

              childCount: widget.photos.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PerformanceMonitor.printResults();
        },
        child: const Icon(Icons.analytics),
      ),
    );
  }
}