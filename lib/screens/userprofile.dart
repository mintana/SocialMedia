import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmedia/api/apiservice.dart';
import 'package:socialmedia/models/appdata.dart';
import 'package:socialmedia/models/usermodel.dart';

class UserProfile extends StatefulWidget {
  final int userId;

  UserProfile({required this.userId});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final ApiService apiService = ApiService();
  UserModel? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      user = await apiService.fetchUser(widget.userId);
    } catch (e) {
      print('Error fetching user: $e');
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : user == null
              ? Center(child: Text('User not found'))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${user!.name}',
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      Text('Username: ${user!.username}',
                          style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Text('Email: ${user!.email}',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
    );
  }
}
