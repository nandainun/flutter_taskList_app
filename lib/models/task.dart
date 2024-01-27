// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String id;
  bool? isDone;
  bool? isDelete;

  Task({
    required this.title,
    required this.id,
    this.isDone,
    this.isDelete,
  }) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
  }

  Task copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDelete,
  }) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'isDone': isDone,
      'isDelete': isDelete,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDelete: map['isDelete'] != null ? map['isDelete'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        isDone,
        isDelete,
      ];
}
