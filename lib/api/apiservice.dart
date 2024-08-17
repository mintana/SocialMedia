import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:socialmedia/exceptions.dart';
import 'package:socialmedia/models/appdata.dart';
import 'package:socialmedia/models/commentmodel.dart';
import 'package:socialmedia/models/postmodel.dart';
import 'package:socialmedia/models/usermodel.dart';

class ApiService {
  final Dio _dio = Dio();

  // Fetch posts
 Future<void> fetchPosts() async {
  try {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      List<PostModel> posts = (response.data as List).map((json) => PostModel.fromJson(json)).toList();
      AppData.instance.posts.assignAll(posts);
    } else {
      throw AppException('Failed to load posts');
    }
  } catch (e) {
    throw AppException('Failed to load posts: $e');
  }
}
  // Fetch comments
  Future<List<CommentModel>> fetchComments(int postId) async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/comments', queryParameters: {'postId': postId});
      if (response.statusCode == 200) {
        return (response.data as List).map((json) => CommentModel.fromJson(json)).toList();
      } else {
        throw AppException('Failed to load comments');
      }
    } catch (e) {
      throw AppException('Failed to load comments: $e');
    }
  }

  // Fetch user
  Future<UserModel> fetchUser(int userId) async {
    try {
     final response = await _dio.get('https://jsonplaceholder.typicode.com/users/$userId');
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw AppException('Failed to load user');
      }
    } catch (e) {
      throw AppException('Failed to load user: $e');
    }
  }
}