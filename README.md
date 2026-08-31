# DevTools Memory Leak Investigation & Performance Optimization Report

**Author:** Marah Naser  
**Branch Comparison:** [View Side-by-Side Code Diff](https://github.com/YOUR_USERNAME/YOUR_REPO/compare/feature/optimized-performance...bad-performance)

---

## 📌 Executive Summary & Comparative Metrics

Over a standardized 60-second profile test, the baseline application (`BadScreen`) was evaluated against the refactored version (`OptimizedScreen`). All memory leaks, retained route instances, and dynamic layout constraints were resolved in the optimized build.

| Metric | BEFORE (`BadScreen`) | AFTER (`OptimizedScreen`) | Delta / Technical Notes |
| :--- | :--- | :--- | :--- |
| **Retained Screen Instances** | **13 instances** (`_BadScreenState`) | **1 instance** (`_OptimizedScreenState`) | **12 Leaked Instances Cleared** |
| **Post-GC Heap Memory** | [ e.g., 85 MB ] | [ e.g., 42 MB ] | [ -43 MB / Cleaned retainers ] |
| **Peak Heap Allocation** | [ e.g., 310 MB ] | [ e.g., 120 MB ] | Unconstrained bitmap decoding fixed |
| **Average Frame Time** | [ e.g., 11.2 ms ] | [ e.g., 10.8 ms ] | [ Measured in profile mode ] |
| **Average UI Time** | [ e.g., 6.4 ms ] | [ e.g., 6.1 ms ] | [ Measured in profile mode ] |
| **Average Raster Time** | [ e.g., 4.8 ms ] | [ e.g., 4.7 ms ] | [ Measured in profile mode ] |
| **Jank Percentage (%)** | [ e.g., 4.2 % ] | [ e.g., 1.8 % ] | [ Reduced frame drops ] |
| **Cold Startup Time** | [ e.g., 450 ms ] | [ e.g., 310 ms ] | `firstFrameRasterizedMicros` / 1000 |
| **Release Application Size** | [ e.g., 18.4 MB ] | [ e.g., 12.1 MB ] | Icon tree-shaking & ABI split |

---

## 🔍 1. Memory Profiling & Leak Analysis

### Reproduction Steps
1. Launched application in profile mode (`flutter run -d linux --profile`).
2. Navigated sequentially across 20 screens (`BadScreen`).
3. Popped back to the home route (Screen 1).
4. Triggered manual Garbage Collection (GC) via Flutter DevTools Memory tab.

### Heap Snapshot Diagnostics
Following manual GC, the Memory Inspector confirmed that 12 unmounted screen states remained trapped in memory instead of being reclaimed by the Garbage Collector.

* **Target Leaked Class:** `_BadScreenState` (13 instances remaining post-GC; expected 1 active instance).
* **Root Cause:** Active periodic timers (`Timer.periodic`), unclosed `StreamController` subscriptions, and an undisposed `ScrollController` listener retained strong references to unmounted route state contexts.

### Retainer Path Trace (DevTools Snapshot)
```text
Isolate → _TimerHeap → _List → _Timer → _Closure → Context → _BadScreenState
