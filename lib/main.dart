import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BreedList());
  }
}

class BreedList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BreedListState();
}

class BreedListState extends State<BreedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(middle: Text('Dog Breeds')),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5 * 2,  // * 2 for dividers
        itemBuilder: (context, i) {
          // Add a one-pixel-high divider widget before each row in theListView.
          if (i.isOdd) return Divider();

          return _buildRow();
        });
  }

  Widget _buildRow() {
    return ListTile(
      title: Text(
        'Border Collie',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
