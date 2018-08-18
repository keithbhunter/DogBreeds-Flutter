import 'package:flutter/material.dart';
import 'widgets/breed_list.dart';

import 'package:dogbreeds_flutter/service/mock_dog_breed_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BreedList(MockDogBreedService()));
  }
}