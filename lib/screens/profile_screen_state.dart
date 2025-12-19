import 'package:complex_data_management/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        actions: [logout(context)],
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Welcome to Profile page')),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Dashboard'),
            ),
          ),
        ],
      ),
    );
  }
}
