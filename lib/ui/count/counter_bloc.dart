import 'dart:async';

import 'package:flutter_note/ui/count/counter_event.dart';

class CounterBloc {
  int _counter = 0;
  final _counterStateController = StreamController<int>();

  /// For state, exposing only a stream which output data
  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  /// For events, exposing only a sink which is input
  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;
  
  CounterBloc() {
    /// Whenever there is a new event, we want to map it to a new state
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}