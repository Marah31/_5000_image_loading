# DevTools Memory Leak Investigation & Performance Optimization Report

**Branch Comparison:** [View Side-by-Side Code Diff](https://github.com/marah/5000_image_loading/compare/bad-performance...optimized-performance)

---

## Summary & Metrics

Over a standardized 60-second profile test, the baseline application (`BadScreen`) was evaluated against the refactored version (`OptimizedScreen`). All memory leaks, retained route instances, and dynamic layout constraints were resolved in the optimized build.

| Metric | BEFORE (`BadScreen`) | AFTER (`OptimizedScreen`) | Delta / Technical Notes |
| :--- | :--- | :--- | :--- |
| **Retained Screen Instances** | **13 instances** (`_BadScreenState`) | **1 instance** (`_OptimizedScreenState`) | **12 Leaked Instances Cleared** |
| **Post-GC Heap Memory** | [ 27.4 MB ] | [ 21.3 MB ] | [ -6.1 MB / Cleaned retainers ] |
| **Average Frame Time** | [ 13.23 ms ] | [ 12.48 ms ] | [ Measured in profile mode ] |
| **Average UI Time** | [ 0.81 ms ] | [ 0.83 ms ] | [ Measured in profile mode ] |
| **Average Raster Time** | [ 5.48 ms ] | [ 5.5 ms ] | [ Measured in profile mode ] |
| **Jank Percentage (%)** | [ 17.57 % ] | [ 17.47 % ] | [ Reduced frame drops ] |
| **Cold Startup Time** | [ 162 ms ] | [ 193 ms ] | `firstFrameRasterizedMicros` / 1000 |
| **Release Application Size** | [ 24 MB ] | [ 24 MB ] | Icon tree-shaking & ABI split |

---

## 1. Memory Profiling & Leak Analysis

### Reproduction Steps
1. Launched application in profile mode (`flutter run -d linux --profile`).
2. Navigated sequentially across 20 screens (`BadScreen`).
3. Popped back to the home route.
4. Triggered manual Garbage Collection (GC) via Flutter DevTools Memory tab.

### Heap Snapshot Diagnostics
Following manual GC, the Memory Inspector confirmed that 12 unmounted screen states remained trapped in memory instead of being reclaimed by the Garbage Collector.

* **Target Leaked Class:** `_BadScreenState` (13 instances remaining post-GC; expected 1 active instance).
* **Root Cause:** Active periodic timers (`Timer.periodic`), unclosed `StreamController` subscriptions, and an undisposed `ScrollController` listener retained strong references to unmounted route state contexts.

### Retainer Path Trace (DevTools Snapshot)
```text
Isolate → _TimerHeap → _List → _Timer → _Closure → Context → _BadScreenState

```
