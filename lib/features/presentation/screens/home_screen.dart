import 'package:flutter/material.dart';
import 'package:hive_lesson/features/presentation/screens/card_screen.dart';
import 'package:hive_lesson/features/presentation/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text("Card"),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardScreen()),
              );
            },
            icon: Icon(Icons.card_travel),
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
