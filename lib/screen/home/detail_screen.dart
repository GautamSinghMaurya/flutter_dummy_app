import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String description;

  const DetailScreen({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read here"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
        
              Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              const SizedBox(height: 16,),
              Text(description)
        
            ],
          ),
        ),
      ),
    );
  }

}