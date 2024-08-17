import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmedia/api/apiservice.dart';
import 'package:socialmedia/controller.dart';
import 'package:socialmedia/models/appdata.dart';
import 'package:socialmedia/models/postmodel.dart';
import 'package:socialmedia/screens/userprofile.dart';

class PostDetails extends StatelessWidget {
  final PostModel post;
  final ApiService apiService = ApiService();

  PostDetails({required this.post});

  @override
  Widget build(BuildContext context) {

    //post controller
    final PostDetailsController controller = Get.put(PostDetailsController(
      apiService: apiService,
      postId: post.id,
      userId: post.userId,
    ));

    return Scaffold(
      appBar: AppBar(title: Text(post.title),
       backgroundColor: Colors.amber,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(post.body,style: TextStyle(fontSize: 15)), 
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.comments.isEmpty) {
                return Center(child: Text('No comments available'));
              } else {
                return ListView.builder(
                  itemCount: controller.comments.length,
                  itemBuilder: (context, index) {
                    final comment = controller.comments[index];
                    return ListTile(
                      title: Text(comment.name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      subtitle: Text(comment.body,style: TextStyle(fontSize: 13)), 
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        onPressed: () {
          Get.to(() => UserProfile(userId: post.userId));
        },
      ),
    );
  }
}