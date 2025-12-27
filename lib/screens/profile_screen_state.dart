import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// আপনার প্রোজেক্টের ইমপোর্ট (প্রয়োজন অনুযায়ী রাখুন)
// import 'package:complex_data_management/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  // API কল ফাংশন
  Future<String> callApi() async {
    final url = Uri.parse('https://api.github.com/users/aslampatwary1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['name'] ?? "No Name Found";
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        // actions: [logout(context)], // আপনার logout ফাংশনটি এখানে থাকবে
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            // FutureBuilder ব্যবহার করে ডেটা দেখানো হচ্ছে
            child: FutureBuilder<String>(
              future: callApi(), // এখানে ফাংশনটি কল করা হয়েছে
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // ডেটা আসার আগ পর্যন্ত লোডিং দেখাবে
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}"); // ভুল হলে এরর দেখাবে
                } else {
                  // ডেটা সফলভাবে আসলে নাম দেখাবে
                  return Text(
                    '${snapshot.data} Welcome to your Profile page',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Dashboard'),
            ),
          ),
        ],
      ),
    );
  }
}
