import 'package:_5000_image_loading/performance_monitor.dart';
import 'package:_5000_image_loading/provider/image_repository_provider.dart';
import 'package:_5000_image_loading/screen/bad_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PerformanceMonitor.start();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevTools Bad Experiment',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BadExperimentHome(),
    );
  }
}

class BadExperimentHome extends ConsumerWidget {
  const BadExperimentHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosState = ref.watch(imageListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DevTools Experiment'),
      ),
      body: photosState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (error, stackTrace) => Center(
          child: Text(
            'Error: $error',
          ),
        ),

        data: (photos) {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    'Open Bad Screen ${index + 1}',
                  ),
                  subtitle: const Text(
                    'Intentionally contains memory/performance problems',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OptimizedScreen(
                          screenNumber: index + 1,
                          photos: photos,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
