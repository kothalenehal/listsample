import 'dart:async';
import 'package:flutter/material.dart';

class CountBloc {
  final _countController = StreamController<Map<int, int>>.broadcast();
  final _countMap = <int, int>{};

  Stream<Map<int, int>> get countStream => _countController.stream;
  Map<int, int> get countMap => _countMap;

  void incrementCount(int index) {
    _countMap[index] = (_countMap[index] ?? 0) + 1;
    _countController.add(_countMap);
  }

  void dispose() {
    _countController.close();
  }
}



class ListWidgetBloc extends StatelessWidget {
  final CountBloc _countBloc = CountBloc();

  ListWidgetBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<int, int>>(
      stream: _countBloc.countStream,
      initialData: _countBloc.countMap,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListItemWidget(
                index: index,
                count: snapshot.data?[index] ?? 0,
                onCountChanged: _countBloc.incrementCount,
              );
            },
          ),
        );
      },
    );
  }

  void dispose() {
    _countBloc.dispose();
  }
}

class ListItemWidget extends StatelessWidget {
  final int index;
  final int count;
  final void Function(int) onCountChanged;

  const ListItemWidget({
    required this.index,
    required this.count,
    required this.onCountChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(count.toString()),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => onCountChanged(index),
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}
