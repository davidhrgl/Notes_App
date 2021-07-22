import 'dart:convert';

MediaModel mediaModelFromJson(String str) => MediaModel.fromJson(json.decode(str));

String mediaModelToJson(MediaModel data) => json.encode(data.toJson());

class MediaModel {
    MediaModel({
        this.id,
        this.idNote,
        this.path,
        this.type,
    });

    int id;
    int idNote;
    String path;
    String type;

    factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        id: json["id"],
        idNote: json["id_note"],
        path: json["path"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_note": idNote,
        "path": path,
        "type": type,
    };
}
