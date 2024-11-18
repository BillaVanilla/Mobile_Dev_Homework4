import 'package:flutter/material.dart';

class MessageBoardPage extends StatelessWidget {
  final List<Map<String, dynamic>> boards = [
    {'name': 'General', 'icon': Icons.chat},
    {'name': 'Announcements', 'icon': Icons.announcement},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message Boards')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        children: boards.map((board) {
          return ListTile(
            leading: Icon(board['icon']),
            title: Text(board['name']),
            onTap: () => Navigator.pushNamed(context, '/chat'),
          );
        }).toList(),
      ),
    );
  }
}
