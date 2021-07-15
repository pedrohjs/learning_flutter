class PokemonDTO {
  late int id;
  late String name;
  late String imageUrl;

  PokemonDTO.map(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.imageUrl = 'https://pokeres.bastionbot.org/images/pokemon/$id.png';
  }
}
