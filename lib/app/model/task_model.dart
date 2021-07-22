import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
    TaskModel({
        this.id,
        this.idNote,
        this.content,
        this.state,
    });

    int id;
    int idNote;
    String content;
    int state;

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        idNote: json["id_note"],
        content: json["content"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_note": idNote,
        "content": content,
        "state": state,
    };
}
