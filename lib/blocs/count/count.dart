import 'package:flutter/material.dart';

import 'package:flutter_note/utils/hx_kit.dart';

import 'package:flutter_note/blocs/count/counter_bloc.dart';
import 'package:flutter_note/blocs/count/counter_event.dart';

class BlocCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Count();
  }
}

class _Count extends StatefulWidget {
  @override
  State<_Count> createState() {
    return _CountState();
  }
}

class _CountState extends State<_Count> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bloc Count'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _bloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'This is a BLoC design pattern page',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: HXKit().randColor()
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                heroTag: 'inc',
                onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              SizedBox(width: 20.0),
              FloatingActionButton(
                heroTag: 'dec',
                onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ]
        )
    );
  }
}
