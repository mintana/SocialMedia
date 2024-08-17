import 'package:flutter/material.dart';

class CommentModel {
  final String name;
  final String body;

  CommentModel({
    required this.name,
    required this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      name: json['name'] as String,
      body: json['body'] as String,
    );
  }
}