class Breed {
  String name;
  List<Breed> subBreeds;
  Breed parentBreed; // Circular reference?

  Breed(this.name);
  Breed.subBreed(this.name, this.parentBreed);
}
