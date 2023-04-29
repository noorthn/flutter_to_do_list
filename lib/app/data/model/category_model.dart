// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
    int? id;
    String? icon;
    String? name;

    Category({
        this.id,
        this.icon,
        this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        icon: json["icon"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
    };
}
