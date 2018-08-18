import 'package:dogbreeds_flutter/model/breed.dart';

class BreedListResponse {
  bool success;
  List<Breed> breeds;

  BreedListResponse.fromJSON(Map<String, dynamic> map) {
    Map<String, dynamic> breedList = map['message'];
    List<Breed> breeds = List();

    breedList.forEach((breedName, subBreeds) {
      Breed breed = Breed(breedName);
      breed.subBreeds = subBreeds
          .map<Breed>((subBreedName) => Breed.subBreed(subBreedName, breed))
          .toList();
      breeds.add(breed);
    });

    this.breeds = breeds;
    this.success = map['status'] == 'success';
  }
}
