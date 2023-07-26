import 'dart:convert';

MainInfo userFromJson(String str) => MainInfo.fromJson(json.decode(str));

String userToJson(MainInfo data) => json.encode(data.toJson());

class MainInfo {
  MainInfo({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory MainInfo.fromJson(Map<String, dynamic> json) => MainInfo(
    name: json['name'] ?? '',
    url: json['url'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
  };
}
