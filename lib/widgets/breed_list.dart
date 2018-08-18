import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:dogbreeds_flutter/service/breed_service.dart';
import 'package:dogbreeds_flutter/model/breed.dart';

class BreedList extends StatefulWidget {
  final BreedService _service;

  BreedList(this._service);

  @override
  State<StatefulWidget> createState() => new _BreedListState();
}

class _BreedListState extends State<BreedList> {
  List<Breed> _breeds;

  @override
  void initState() {
    super.initState();

    widget._service.fetchBreedList().then((breeds) {
      setState(() {
        _breeds = breeds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(middle: Text('Dog Breeds')),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: (_breeds?.length ?? 0) * 2, // * 2 for dividers
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          return _buildRow(_breeds[i ~/ 2].name);
        });
  }

  Widget _buildRow(String name) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
