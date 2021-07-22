import 'dart:convert';
export 'media_model.dart';
export 'task_model.dart';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
    NoteModel({
        this.id,
        this.title,
        this.content,
        this.color,
    });

    int id;
    String title;
    String content;
    String color;

    factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,        
        "content": content,
        "color": color,
    };
}
