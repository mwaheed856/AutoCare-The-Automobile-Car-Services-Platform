import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class AllUsersPage extends StatelessWidget {
  final usersRef = FirebaseDatabase.instance.ref("users");
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Users")),
      body: StreamBuilder<DatabaseEvent>(
        stream: usersRef.onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final data = snapshot.data!.snapshot.value;

          if (data == null) {
            return Center(child: Text("No users found in database."));
          }

          if (data is! Map) {
            return Center(child: Text("Invalid data format."));
          }

          final Map<dynamic, dynamic> users = data;
          final userList = users.entries.where((e) => e.key != currentUserId).toList();

          if (userList.isEmpty) {
            return Center(child: Text("No other users available."));
          }

          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final userEntry = userList[index];
              final userId = userEntry.key;
              final userData = userEntry.value as Map;

              return ListTile(
                title: Text(userData["name"] ?? "No Name"),
                subtitle: Text(userData["email"] ?? ""),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatPage(
                        otherUserId: userId,
                        otherUserName: userData["name"] ?? "Chat",
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
