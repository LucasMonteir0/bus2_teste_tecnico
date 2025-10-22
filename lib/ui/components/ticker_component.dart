import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerComponent extends StatefulWidget {
  final VoidCallback onTick;

  final Duration duration;

  const TickerComponent({
    super.key,
    required this.onTick,
    this.duration = const Duration(seconds: 5),
  });

  @override
  State<TickerComponent> createState() => _TickerComponentState();
}

class _TickerComponentState extends State<TickerComponent>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  Duration _elapsed = Duration.zero;
  int _processedIntervals = 0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTickerTick);
    _ticker.start();
  }

  void _onTickerTick(Duration elapsedTime) {
    setState(() {
      _elapsed = elapsedTime;
    });

    final int intervalsPassed =
        (_elapsed.inMilliseconds / widget.duration.inMilliseconds).floor();

    if (intervalsPassed > _processedIntervals) {
      widget.onTick();

      _processedIntervals = intervalsPassed;
    }
  }

  @override
  void dispose() {
    _ticker.stop();
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double lastIntervalTimeMs =
        (_processedIntervals * widget.duration.inMilliseconds).toDouble();
    final double timeInCurrentIntervalMs =
        _elapsed.inMilliseconds - lastIntervalTimeMs;
    final double progress =
        timeInCurrentIntervalMs / widget.duration.inMilliseconds;
    return Stack(
      children: [
        CircularProgressIndicator(
          value: progress.clamp(0.0, 1.0),
          strokeWidth: 2,
        ),
        Positioned.fill(
          child: Icon(
            Icons.timer_outlined,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
