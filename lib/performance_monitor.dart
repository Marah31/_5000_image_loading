import 'dart:math' as math;
import 'package:flutter/scheduler.dart';

class PerformanceMonitor {
  static final List<FrameTiming> _frames = [];

  static void start() {
    SchedulerBinding.instance.addTimingsCallback(_onTimings);
  }

  static void stop() {
    SchedulerBinding.instance.removeTimingsCallback(_onTimings);
  }

  static void reset() {
    _frames.clear();
  }

  static void _onTimings(List<FrameTiming> timings) {
    _frames.addAll(timings);
  }

  static void printResults() {
    if (_frames.isEmpty) {
      print('No frame data collected.');
      return;
    }

    final totalFrames = _frames.length;

    final totalFrameTimes = _frames.map(
      (frame) => frame.totalSpan.inMicroseconds / 1000.0,
    );

    final totalUiTimes = _frames.map(
      (frame) => frame.buildDuration.inMicroseconds / 1000.0,
    );

    final totalRasterTimes = _frames.map(
      (frame) => frame.rasterDuration.inMicroseconds / 1000.0,
    );

    final frameTimes = totalFrameTimes.toList();
    final uiTimes = totalUiTimes.toList();
    final rasterTimes = totalRasterTimes.toList();

    final averageFrameTime =
        frameTimes.reduce((a, b) => a + b) / totalFrames;

    final averageUiTime =
        uiTimes.reduce((a, b) => a + b) / totalFrames;

    final averageRasterTime =
        rasterTimes.reduce((a, b) => a + b) / totalFrames;

    final worstFrameTime = frameTimes.reduce(math.max);

    // Assuming a 60 Hz display:
    // 16.67 ms is the frame budget.
    final jankyFrames =
        frameTimes.where((time) => time > 16.67).length;

    final jankPercentage =
        (jankyFrames / totalFrames) * 100;

    print('');
    print('==========================================');
    print('        FLUTTER PERFORMANCE RESULTS');
    print('==========================================');

    print('Total frames:       $totalFrames');

    print(
      'Janky frames:       $jankyFrames',
    );

    print(
      'Jank percentage:    ${jankPercentage.toStringAsFixed(2)}%',
    );

    print(
      'Average frame:      ${averageFrameTime.toStringAsFixed(2)} ms',
    );

    print(
      'Average UI:         ${averageUiTime.toStringAsFixed(2)} ms',
    );

    print(
      'Average Raster:     ${averageRasterTime.toStringAsFixed(2)} ms',
    );

    print(
      'Worst frame:        ${worstFrameTime.toStringAsFixed(2)} ms',
    );

    print('==========================================');
    print('');
  }
}

