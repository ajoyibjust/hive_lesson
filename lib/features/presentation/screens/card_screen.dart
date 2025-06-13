import 'package:flutter/material.dart';
import 'package:hive_lesson/features/presentation/widgets/card_body.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cards")),
      body: CardBody(),
    );
  }
}
