
import 'package:flutter/material.dart';
import 'package:list/list.dart';
import 'package:list/list_modified.dart';
import 'package:list/list_with_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
    const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListWidget()));
              },
              child: const Text('Modified your Code'),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListWidgetBloc()));
               },
              child: const Text('Same Code with BloC'),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const ListWidgetModified()));
               },
              child: const Text('Achieved Same output with modification'),
            ),

          ],
        ),
      ),

    );
  }
}


