import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String boardName;

  ChatPage(this.boardName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(boardName)),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return ListView(
            children: snapshot.data!.docs.map<Widget>((doc) {
              return ListTile(
                title: Text(doc['message']),
                subtitle: Text('${doc['username']} - ${doc['datetime']}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
