// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    ResponseModel({
        this.classId,
        this.className,
        this.nbBillons,
        this.imageName
    });

    int classId;
    String className;
    int nbBillons;
    String imageName;

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        classId: json["class_id"],
        className: json["class_name"],
        nbBillons: json["nb_billons"],
        imageName: json["image_name"],
    );

    Map<String, dynamic> toJson() => {
        "class_id": classId,
        "class_name": className,
        "nb_billons": nbBillons,
        "image_name": imageName,
    };
}
