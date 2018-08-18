import 'dart:convert';
import 'dart:async';

import 'package:flutter/services.dart';

import 'breed_service.dart';
import 'breed_list_response.dart';
import 'package:dogbreeds_flutter/model/breed.dart';

class MockDogBreedService implements BreedService {
  @override
  Future<List<Breed>> fetchBreedList() {
    final completer = Completer<List<Breed>>();

    rootBundle.loadString('lib/service/list.json').then((contents) {
      final jsonMap = json.decode(contents);
      completer.complete(BreedListResponse.fromJSON(jsonMap).breeds);
    });

    return completer.future;
  }
}
