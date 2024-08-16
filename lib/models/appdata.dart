import 'package:flutter/material.dart';
import 'package:socialmedia/models/commentmodel.dart';
import 'package:socialmedia/models/postmodel.dart';
import 'package:socialmedia/models/usermodel.dart';


class AppData {
  static UserModel? _user;
  AppData._privateConstructor();

  static final AppData _instance = AppData._privateConstructor();

  static AppData get instance => _instance;

  List<PostModel>? posts;
  List<CommentModel>? comments;
  List<UserModel>? users;

  void clearData() {
    posts = null;
    comments = null;
    users = null;
  }
}