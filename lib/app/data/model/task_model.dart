// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
    int? id;
    String? icon;
    String? name;
    String? category;
    String? description;
    int? status;
    int? priority;
    int? withAlert;
    String? dateAlert;
    String? createDate;
    String? endDate;

    Task({
        this.id,
        this.icon,
        this.name,
        this.category,
        this.description,
        this.status,
        this.priority,
        this.withAlert,
        this.dateAlert,
        this.createDate,
        this.endDate,
    });

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        icon: json["icon"],
        name: json["name"],
        category: json["category"],
        description: json["description"],
        status: json["status"],
        priority: json["priority"],
        withAlert: json["withAlert"],
        dateAlert: json["dateAlert"],
        createDate: json["createDate"],
        endDate: json["endDate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
        "category": category,
        "description": description,
        "status": status,
        "priority": priority,
        "withAlert": withAlert,
        "dateAlert": dateAlert,
        "createDate": createDate,
        "endDate": endDate,
    };
}
