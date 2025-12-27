// import 'package:complex_data_management/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        // actions: [logout(context)],
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Now, I am in Home Page')),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.push('/profile');
              },
              child: Text('Go to Profile'),
            ),
          ),
        ],
      ),
    );
  }
}
