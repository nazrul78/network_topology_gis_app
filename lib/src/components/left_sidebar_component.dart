import 'package:flutter/material.dart';

class LeftSidebarComponent extends StatelessWidget {
  const LeftSidebarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Hello>>>>>>>'),
                  Text('Hello2>>>>>>'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
