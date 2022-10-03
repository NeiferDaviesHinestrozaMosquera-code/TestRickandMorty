class Location {
    Location({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}
