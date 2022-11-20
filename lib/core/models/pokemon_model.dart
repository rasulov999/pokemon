import 'package:pokemon/core/models/pokemon.dart';

class PokemonModel {
  List<Pokemon>? pokemon;
  PokemonModel({required this.pokemon});
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        pokemon: (json['pokemon'] as List)
            .map((pokemon) => Pokemon.fromjson(pokemon))
            .toList());
  }
}
