import 'dart:convert';

PokemonInfo pokemonInfoFromJson(String str) => PokemonInfo.fromJson(json.decode(str));

String pokemonInfoToJson(PokemonInfo data) => json.encode(data.toJson());

class PokemonInfo {
  
  int baseExperience;
  int weight;
  int height;
  int id;
  
  String name;

  List<Ability> abilities;
  List<Form> forms;
  List<Stat> stats;
  List<Type> types;
  List<Move> moves;
  
  Sprites sprites;

  Species species;

  PokemonInfo({
    required this.baseExperience,
    required this.weight,
    required this.height,
    required this.id,

    required this.name,
    
    required this.abilities,
    required this.forms,
    required this.stats,
    required this.types,
    required this.moves,
    
    required this.sprites,
    required this.species,
  });

  factory PokemonInfo.fromJson(Map<String, dynamic> json) => PokemonInfo(
    baseExperience: json["base_experience"],
    weight: json["weight"],
    height: json["height"],
    id: json["id"],

    name: json["name"],
    
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
    forms: List<Form>.from(json["forms"].map((x) => Form.fromJson(x))),
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
    
    sprites: Sprites.fromJson(json["sprites"]),
    species: Species.fromJson(json["species"]),
  );

  Map<String, dynamic> toJson() => {
    "base_experience": baseExperience,
    "weight": weight,
    "height": height,
    "id": id,

    "name": name,
    
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
    
    "sprites": sprites.toJson(),
    "species": species.toJson(),
  };
}

class Ability {
  Form ability;

  Ability({
    required this.ability,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    ability: Form.fromJson(json["ability"]),
  );

  Map<String, dynamic> toJson() => {
    "ability": ability.toJson(),
  };
}

class Form {
  String name;
  String url;

  Form({
    required this.name,
    required this.url,
  });

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class Sprites {
  Other other;

  Sprites({
    required this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    other: Other.fromJson(json["other"]),
  );

  Map<String, dynamic> toJson() => {
    "other": other.toJson(),
  };
}

class Species {
  String name;

  Species({
    required this.name,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Other {
  DreamWorld dreamWorld;

  Other({
    required this.dreamWorld
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    dreamWorld: DreamWorld.fromJson(json["dream_world"])
  );

  Map<String, dynamic> toJson() => {
    "dream_world": dreamWorld.toJson()
  };
}

class DreamWorld {
  String frontDefault;
  dynamic frontFemale;

  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
  };
}

class Stat {
  int baseStat;
  int effort;
  Form stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Form.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class Type {
  int slot;
  Form type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Form.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}

class Move {
  MoveClass move;

  Move({
    required this.move,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
    move: MoveClass.fromJson(json["move"]),
  );

  Map<String, dynamic> toJson() => {
    "move": move.toJson(),
  };
}

class MoveClass {
  String name;

  MoveClass({
    required this.name,
  });

  factory MoveClass.fromJson(Map<String, dynamic> json) => MoveClass(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}