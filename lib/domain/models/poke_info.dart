import 'dart:convert';

PokemonInfo pokemonInfoFromJson(String str) => PokemonInfo.fromJson(json.decode(str));

String pokemonInfoToJson(PokemonInfo data) => json.encode(data.toJson());

class PokemonInfo {
  int id;
  String name;
  List<Ability> abilities;
  int baseExperience;
  List<Form> forms;
  List<Stat> stats;
  List<Type> types;
  int weight;
  Sprites sprites;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.stats,
    required this.types,
    required this.weight,
    required this.sprites,
  });

  factory PokemonInfo.fromJson(Map<String, dynamic> json) => PokemonInfo(
    id: json["id"],
    name: json["name"],
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
    baseExperience: json["base_experience"],
    forms: List<Form>.from(json["forms"].map((x) => Form.fromJson(x))),
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    weight: json["weight"],
    sprites: Sprites.fromJson(json["sprites"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "base_experience": baseExperience,
    "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "weight": weight,
    "sprites": sprites.toJson(),
  };
}

class Ability {
  Form ability;
  bool isHidden;
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    ability: Form.fromJson(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

  Map<String, dynamic> toJson() => {
    "ability": ability.toJson(),
    "is_hidden": isHidden,
    "slot": slot,
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
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;
  Other other;

  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    required this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    backDefault: json["back_default"],
    backFemale: json["back_female"],
    backShiny: json["back_shiny"],
    backShinyFemale: json["back_shiny_female"],
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
    other: Other.fromJson(json["other"]),
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_female": backFemale,
    "back_shiny": backShiny,
    "back_shiny_female": backShinyFemale,
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
    "other": other.toJson(),
  };
}

class Other {
  DreamWorld dreamWorld;
  Home home;
  OfficialArtwork officialArtwork;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    dreamWorld: DreamWorld.fromJson(json["dream_world"]),
    home: Home.fromJson(json["home"]),
    officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
  );

  Map<String, dynamic> toJson() => {
    "dream_world": dreamWorld.toJson(),
    "home": home.toJson(),
    "official-artwork": officialArtwork.toJson(),
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

class Home {
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

class OfficialArtwork {
  String frontDefault;
  String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_shiny": frontShiny,
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
