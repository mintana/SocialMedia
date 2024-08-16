import 'package:flutter/material.dart';
import 'package:socialmedia/api/apiservice.dart';
import 'package:socialmedia/models/appdata.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  HomeScreen() {
    apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Column()
    );
  }
}