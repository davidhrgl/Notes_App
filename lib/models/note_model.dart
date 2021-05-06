import 'dart:convert';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
    NoteModel({
        this.id,
        this.title,
        this.image,
        this.tasks,
        this.content,
        this.color,
    });

    int id;
    String title;
    List<String> image;
    List<String> tasks;
    String content;
    String color;

    factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json["id"],
        title: json["title"],
        image: List<String>.from(json["image"].map((x) => x)),
        tasks: List<String>.from(json["tasks"].map((x) => x)),
        content: json["content"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": List<dynamic>.from(image.map((x) => x)),
        "tasks": List<dynamic>.from(tasks.map((x) => x)),
        "content": content,
        "color": color,
    };
}
