import 'dart:convert';

import 'package:pokemon/core/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class Service {
  static Future<PokemonModel?> getData() async {
    String url =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;
      return PokemonModel.fromJson(json);
    }
    return null;
  }
}
