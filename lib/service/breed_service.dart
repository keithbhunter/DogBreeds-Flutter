import 'dart:async';

import 'package:dogbreeds_flutter/model/breed.dart';

abstract class BreedService {
  Future<List<Breed>> fetchBreedList();
}
