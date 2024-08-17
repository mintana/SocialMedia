import 'package:flutter/material.dart';
import 'package:socialmedia/api/apiservice.dart';
import 'package:socialmedia/models/appdata.dart';
import 'package:get/get.dart';
import 'package:socialmedia/screens/postdetails.dart';
import 'package:socialmedia/screens/userprofile.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  HomeScreen() {
    apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Get.to(() => UserProfile(userId: 1));
            },
          ),
        ],
      ),
      body: Obx(() {
        var posts = AppData.instance.posts;
        if (posts.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Container(
              child: ListTile(
                title: Text(post.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                subtitle: Text(post.body,style: TextStyle(fontSize: 14)),
                onTap: () {
                  Get.to(() => PostDetails(post: post));
                },
              ),
            );
          },
        );
      }),
      
    );
  }
}
