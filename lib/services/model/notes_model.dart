import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String time;
  String body;
  String title;
  NotesModel({
    this.time = '',
    this.body = '',
    this.title = '',
  });

  factory NotesModel.fromSnapshot(DocumentSnapshot map) => NotesModel(
        time: map['time'],
        body: map['body'],
        title: map['title'],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'body': body,
      'title': title,
    };
  }

  NotesModel.fromJson(Map<String, dynamic> json)
      : time = json['time'],
        body = json['body'],
        title = json['title'];
}
