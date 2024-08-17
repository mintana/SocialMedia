import 'package:flutter/material.dart';
import 'package:socialmedia/api/apiservice.dart';
import 'package:socialmedia/models/postmodel.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final ApiService apiService = ApiService();

  void _submitPost() async {
    final title = _titleController.text;
    final body = _bodyController.text;

    if (title.isNotEmpty && body.isNotEmpty) {
      final post = PostModel(
        userId: 1, // Set a default userId or implement user selection
        id: 0, // This will be auto-assigned by the server
        title: title,
        body: body,
      );

      try {
        await apiService.createPost(post);
        Navigator.pop(context); // Go back to HomeScreen
      } catch (e) {
        // Handle error
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to create post: $e'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(ctx).pop(),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}