import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_http/user_model.dart';
import 'package:user_http/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const myHomePage(title: 'Home Page'),
    );
  }
}

class myHomePage extends StatefulWidget {
  final String title;

  const myHomePage({super.key, required this.title});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  Future<User> getUsers = UserRepository(Client()).getUser();
   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: getUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final user = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Id: ${user.id}'),
                Text('Name: ${user.name}'),
                Text('Email: ${user.email}'),
                Text('Website: ${user.website}'),
              ]
            )
          );
        },
      ),
    );
  }
}
