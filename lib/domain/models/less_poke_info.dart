import 'dart:convert';

LessPokemonInfo pokemonInfoFromJson(String str) => LessPokemonInfo.fromJson(json.decode(str));

String pokemonInfoToJson(LessPokemonInfo data) => json.encode(data.toJson());

class LessPokemonInfo {

  int id;
  String name;
  List<Type> types;

  Sprites sprites;
  
  LessPokemonInfo({
    required this.name,
    required this.id,
    required this.types,
    required this.sprites,
  });

  factory LessPokemonInfo.fromJson(Map<String, dynamic> json) => LessPokemonInfo(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    sprites: Sprites.fromJson(json["sprites"])
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "sprites": sprites.toJson()
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
