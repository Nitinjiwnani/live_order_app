import 'package:flutter/material.dart';

class CompletedTab extends StatelessWidget {
  const CompletedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Completed Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}