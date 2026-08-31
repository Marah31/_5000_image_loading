import 'dart:async';

import 'package:_5000_image_loading/performance_monitor.dart';
import 'package:flutter/material.dart';
import 'package:_5000_image_loading/domain/entity/image_entity.dart';

class BadScreen extends StatefulWidget {
  final int screenNumber;
  final List<ImageEntity> photos;

  const BadScreen({
    super.key,
    required this.screenNumber,
    required this.photos,
  });

  @override
  State<BadScreen> createState() => _BadScreenState();
}

class _BadScreenState extends State<BadScreen> {
  late ScrollController _scrollController;

  Timer? _timer;

  StreamController<String>? _streamController;

  StreamSubscription<String>? _subscription;

  // This list intentionally holds references to objects from the screen.
  final List<String> _largeData = [];

  @override
  void initState() {
    super.initState();

    // BAD #1: ScrollController is created but will not be disposed

    _scrollController = ScrollController();

    // BAD #2: Listener is added but will not be removed

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        print(
          'Screen ${widget.screenNumber}: '
          '${_scrollController.position.pixels}',
        );
      }
    });

    // BAD #3: Periodic timer will not be cancelled

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        // print(
        //   'BAD TIMER STILL RUNNING - '
        //   'Screen ${widget.screenNumber}',
        // );
      },
    );

    // BAD #4: Stream subscription will not be cancelled

    _streamController = StreamController<String>();

    _subscription = _streamController!.stream.listen(
      (message) {
        // print(
        //   'BAD STREAM STILL RUNNING - '
        //   'Screen ${widget.screenNumber}: $message',
        // );
      },
    );

    // BAD #5: Keep unnecessary data alive

    for (int i = 0; i < 10000; i++) {
      _largeData.add(
        'Screen ${widget.screenNumber} - '
        'This is unnecessary data that stays in memory - $i',
      );
    }

    // Start producing stream events.
    Timer.periodic(
      const Duration(milliseconds: 500),
      (_) {
        _streamController?.add(
          'Event from screen ${widget.screenNumber}',
        );
      },
    );
  }

  @override
  void dispose() {
    print(
      'DISPOSING SCREEN ${widget.screenNumber} '
      '(but resources are intentionally NOT cleaned up)',
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bad Screen ${widget.screenNumber}',
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        cacheExtent: 1000,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bad Screen ${widget.screenNumber}',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'This screen intentionally contains '
                    'memory/performance problems for the DevTools experiment.',
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Photos: ${widget.photos.length}',
                  ),

                  Text(
                    'Artificial data entries: ${_largeData.length}',
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // BAD #6: Build a lot of relatively expensive widgets

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final photo = widget.photos[index];

                // Intentionally use a relatively large image.
                final imageUrl =
                    'https://picsum.photos/seed/'
                    '${photo.id}/800/800';

                return Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      children: [
                        Image.network(
                          imageUrl,
                          width: 800,
                          height: 800,

                          // Intentionally not constraining decoded
                          // image memory to display size.
                          fit: BoxFit.cover,

                          errorBuilder:
                              (context, error, stackTrace) {
                            return const SizedBox(
                              width: 800,
                              height: 800,
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

