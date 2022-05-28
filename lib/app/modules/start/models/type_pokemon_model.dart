import 'package:flutter/material.dart';

class TypePokemon {
  String? name;
  Color? cor;
  TypePokemon({
    this.name,
    this.cor,
  });

  factory TypePokemon.fromMap(Map<String, dynamic> map) {
    String nameType = map['name'];

    Color? colorType;

    switch (nameType) {
      case 'normal':
        colorType = Color.fromARGB(200, 154, 108, 146);
        break;
      case 'fighting':
        colorType = Color.fromARGB(255, 202, 91, 17);
        break;
      case 'flying':
        colorType = Color.fromARGB(255, 86, 123, 138);
        break;
      case 'poison':
        colorType = Color.fromARGB(255, 109, 27, 153);
        break;
      case 'ground':
        colorType = Color.fromARGB(255, 155, 107, 10);
        break;
      case 'rock':
        colorType = Color.fromARGB(255, 92, 47, 3);
        break;
      case 'bug':
        colorType = Color.fromARGB(255, 111, 126, 52);
        break;
      case 'ghost':
        colorType = Color.fromARGB(255, 62, 34, 109);
        break;
      case 'steel':
        colorType = Color.fromARGB(255, 131, 163, 150);
        break;
      case 'fire':
        colorType = Color.fromARGB(255, 211, 15, 38);
        break;
      case 'water':
        colorType = Color.fromARGB(255, 71, 90, 173);
        break;
      case 'grass':
        colorType = Color.fromARGB(255, 7, 190, 46);
        break;
      case 'electric':
        colorType = Color.fromARGB(255, 234, 230, 4);
        break;
      case 'psychic':
        colorType = Color.fromARGB(255, 231, 30, 187);
        break;
      case 'ice':
        colorType = Color.fromARGB(255, 152, 218, 211);
        break;
      case 'dragon':
        colorType = Color.fromARGB(255, 73, 130, 199);
        break;
      case 'dark':
        colorType = Color.fromARGB(255, 16, 4, 40);
        break;
      case 'fairy':
        colorType = Color.fromARGB(255, 192, 29, 75);
        break;
      default:
        colorType = Color.fromARGB(255, 73, 73, 70);
        break;
    }
    return TypePokemon(
      name: nameType,
      cor: colorType,
    );
  }

  @override
  String toString() => 'TypePokemon(name: $name, cor: $cor)';
}
