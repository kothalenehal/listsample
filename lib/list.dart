import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final Map<int, int> counts = {};

  ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListItemWidget(
            count: counts[index] ?? 0,
            onCountChanged: (newCount) {
              counts[index] = newCount;
            },
          );
        },
      ),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  final int count;
  final ValueChanged<int> onCountChanged;

  const ListItemWidget({
    required this.count,
    required this.onCountChanged,
    Key? key,
  }) : super(key: key);

  @override
  ListItemWidgetState createState() => ListItemWidgetState();
}

class ListItemWidgetState extends State<ListItemWidget> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  void _incrementCount() {
    setState(() {
      _count++;
      widget.onCountChanged(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(_count.toString()),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: _incrementCount,
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}
