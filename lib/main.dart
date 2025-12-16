import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Complex Data Management', home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _msgController = TextEditingController();

  List<MsgObj> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Management'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(hint: Text('Title')),
                      ),
                      TextField(
                        controller: _msgController,
                        decoration: InputDecoration(hint: Text('Message')),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _posts.add(
                      MsgObj(
                        title: _titleController.text,
                        msg: _msgController.text,
                      ),
                    );
                    [_titleController, _msgController].forEach((element) {
                      element.clear();
                    });
                  });
                },
                child: Text('Add'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _posts.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text(index.toString()),
                title: Text(_posts[index].title),
                subtitle: Text(_posts[index].msg),
                trailing: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MsgObj {
  final String title;
  final String msg;

  MsgObj({required this.title, required this.msg});
}
