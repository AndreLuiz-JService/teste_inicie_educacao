import 'dart:convert';

import 'package:flutter/foundation.dart';

class Pokemon {
  int? id;
  String? name;
  List<String>? types;
  String? image;
  String? description;
  String? generation;
  int? attack;
  int? specialattack;
  int? hp;
  int? defense;
  int? specialdefense;
  int? speed;
  Pokemon({
    this.id,
    this.name,
    this.types,
    this.image,
    this.description,
    this.generation,
    this.attack,
    this.specialattack,
    this.hp,
    this.defense,
    this.specialdefense,
    this.speed,
  });

  String get formatedId => '#${id!.toString().padLeft(4, '0')}';

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    final listTypes = map['types'] as List;
    final image = map['sprites']['other']['official-artwork']['front_default'];
    return Pokemon(
      id: map['id'],
      name: map['name'],
      types: listTypes.map((e) => e['type']['name'] as String).toList(),
      image: image,
      hp: map['stats'][0]['base_stat'],
      attack: map['stats'][1]['base_stat'],
      defense: map['stats'][2]['base_stat'],
      specialattack: map['stats'][3]['base_stat'],
      specialdefense: map['stats'][4]['base_stat'],
      speed: map['stats'][5]['base_stat'],
    );
  }

  void setEspecies(Map<String, dynamic> map){
    description = (map['flavor_text_entries'][0]['flavor_text'] as String);
    generation = map['generation']['name'];
  }

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, types: $types, image: $image, description: $description, generation: $generation, attack: $attack, specialattack: $specialattack, hp: $hp, defense: $defense, specialdefense: $specialdefense, speed: $speed)';
  }
}
