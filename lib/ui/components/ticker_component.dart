import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/helpers/ticker_helper.dart';

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
    with SingleTickerProviderStateMixin, RouteAware {
  late final RouteObserver<ModalRoute<void>> _routeObserver;
  ModalRoute<void>? _route;
  late final TickerHelper _helper;

  @override
  void initState() {
    super.initState();
    _routeObserver = Modular.get<RouteObserver<ModalRoute<void>>>();
    _helper = TickerHelper(
      vsync: this,
      onTick: widget.onTick,
      duration: widget.duration,
      onUpdate: () {
        if (mounted) {
          setState(() {});
        }
      },
    );

    _helper.start();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route = ModalRoute.of(context);
    if (_route != null) {
      _routeObserver.subscribe(this, _route!);
    }
  }

  @override
  void dispose() {
    if (_route != null) {
      _routeObserver.unsubscribe(this);
    }
    _helper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircularProgressIndicator(
          value: _helper.progress,
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

  @override
  void didPushNext() {
    _helper.pause();
  }

  @override
  void didPopNext() {
    _helper.resume();
  }
}
