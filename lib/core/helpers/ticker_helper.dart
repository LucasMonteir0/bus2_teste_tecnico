import 'package:flutter/scheduler.dart';

class TickerHelper {
  final TickerProvider _vsync;
  final VoidCallback _onTickCallback;
  final Duration _duration;

  final VoidCallback _onUpdateCallback;

  late Ticker _ticker;
  Duration _elapsed = Duration.zero;
  Duration _previouslyElapsed = Duration.zero;
  int _processedIntervals = 0;

  TickerHelper({
    required TickerProvider vsync,
    required VoidCallback onTick,
    required Duration duration,
    required VoidCallback onUpdate,
  }) : _vsync = vsync,
       _onTickCallback = onTick,
       _duration = duration,
       _onUpdateCallback = onUpdate {
    _ticker = _vsync.createTicker(_onTickerTick);
  }

  double get progress {
    final double lastIntervalTimeMs =
        (_processedIntervals * _duration.inMilliseconds).toDouble();
    final double timeInCurrentIntervalMs =
        _elapsed.inMilliseconds - lastIntervalTimeMs;

    if (_duration.inMilliseconds == 0) return 1.0;

    final double progress = timeInCurrentIntervalMs / _duration.inMilliseconds;
    return progress.clamp(0.0, 1.0);
  }

  void _onTickerTick(Duration elapsedTime) {
    _elapsed = _previouslyElapsed + elapsedTime;

    final int intervalsPassed =
        (_elapsed.inMilliseconds / _duration.inMilliseconds).floor();

    if (intervalsPassed > _processedIntervals) {
      _onTickCallback();
      _processedIntervals = intervalsPassed;
    }

    _onUpdateCallback();
  }

  void start() {
    _ticker.start();
  }

  void pause() {
    if (_ticker.isTicking) {
      _ticker.stop();
      _previouslyElapsed = _elapsed;
    }
  }

  void resume() {
    if (!_ticker.isTicking) {
      _ticker.start();
    }
  }

  void dispose() {
    _ticker.stop();
    _ticker.dispose();
  }
}
