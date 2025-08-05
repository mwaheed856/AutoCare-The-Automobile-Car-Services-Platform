import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../posts/your_posts.dart';

class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Colors.blueGrey,

      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(height: 10),

          ListTile(
            leading: Icon(CupertinoIcons.doc_text, color: Colors.black),
            title: Text("Your Posts"),
            onTap: () {
              // Navigate to Your Posts screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YourPostsPage(

                  ),
                ),
              );            },
          ),
          Divider(),

          ListTile(
            leading: Icon(CupertinoIcons.heart, color: Colors.black),
            title: Text("Saved Posts"),
            onTap: () {

            },
          ),
          Divider(),

          ListTile(
            leading: Icon(CupertinoIcons.person_crop_circle_badge_xmark, color: Colors.red),
            title: Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              // Add logout logic here
              _confirmLogout(context);
            },
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Add FirebaseAuth.instance.signOut(); here if using Firebase Auth
                Navigator.of(ctx).pop();
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
