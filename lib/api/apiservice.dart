import 'package:dio/dio.dart';
import 'package:socialmedia/models/appdata.dart';
import 'package:socialmedia/models/commentmodel.dart';
import 'package:socialmedia/models/postmodel.dart';
import 'package:socialmedia/models/usermodel.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> fetchPosts() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        List<PostModel> posts = (response.data as List).map((json) => PostModel.fromJson(json)).toList();
        AppData.instance.posts = posts;
      } 
    } catch (e) {
      
    }
  }

  Future<void> fetchComments(int postId) async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/comments', queryParameters: {'postId': postId});
      if (response.statusCode == 200) {
        List<CommentModel> comments = (response.data as List).map((json) => CommentModel.fromJson(json)).toList();
        AppData.instance.comments = comments;
      } 
    } catch (e) {
      
    }
  }

  Future<void> fetchUser(int userId) async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/users/$userId');
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        AppData.instance.users = [user];
      } 
    } catch (e) {
    
    }
  }

  Future<void> createPost(PostModel post) async {
    try {
      final response = await _dio.post('https://jsonplaceholder.typicode.com/posts', data: post);
      if (response.statusCode == 201) {
        AppData.instance.posts?.add(post);
      }
    } catch (e) {
    }
  }
}