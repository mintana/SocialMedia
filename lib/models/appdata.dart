import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmedia/models/commentmodel.dart';
import 'package:socialmedia/models/postmodel.dart';
import 'package:socialmedia/models/usermodel.dart';


class AppData {
  AppData.mycon();

 static final AppData instance = AppData.constt();
  int? currentUserId;

  AppData.constt();
  var posts = <PostModel>[].obs;
  var comments = <CommentModel>[].obs;
  var users = <UserModel>[].obs;
}