// To parse this JSON data, do
//
//     final episodesRickSimpleList = episodesRickSimpleListFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EpisodesRickSimpleList episodesRickSimpleListFromMap(String str) => EpisodesRickSimpleList.fromMap(json.decode(str));

String episodesRickSimpleListToMap(EpisodesRickSimpleList data) => json.encode(data.toMap());

class EpisodesRickSimpleList {
    EpisodesRickSimpleList({
        required this.info,
        required this.results,
    });

    Info info;
    List<Result> results;

    factory EpisodesRickSimpleList.fromMap(Map<String, dynamic> json) => EpisodesRickSimpleList(
        info: Info.fromMap(json["info"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}

class Info {
    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    int count;
    int pages;
    String next;
    dynamic prev;

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class Result {
    Result({
        required this.id,
        required this.name,
        required this.airDate,
        required this.episode,
        required this.characters,
        required this.url,
        required this.created,
    });

    int id;
    String name;
    String airDate;
    String episode;
    List<String> characters;
    String url;
    DateTime created;

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}
