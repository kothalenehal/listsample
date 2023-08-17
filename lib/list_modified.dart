import 'package:flutter/material.dart';

class ListWidgetModified extends StatelessWidget {

  const ListWidgetModified({super.key});


  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    for (var i = 0; i <= 100; i++) {
      list.add(  ListItemWidget(count: 0,));
    }

    return Scaffold(appBar: AppBar(), body: ListView.builder(itemCount: list.length,itemBuilder: (context,index)=> list[index]));
  }
}

class ListItemWidget extends StatefulWidget {
  int count;
  ListItemWidget({this.count=0,super.key});
  @override
  State<ListItemWidget> createState() => ListItemWidgetState();
}


class ListItemWidgetState extends State<ListItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Text(widget.count.toString()),
            MaterialButton(
              onPressed: () {
                setState(() {
                  int val=widget.count;
                  val++;
                  widget.count = val;
                });
              },
              child: const Text("+"),
            )
          ],
        ));
  }
}
