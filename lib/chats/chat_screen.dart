import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  final String otherUserId;
  final String otherUserName;

  ChatPage({required this.otherUserId, required this.otherUserName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final TextEditingController _msgController = TextEditingController();

  late String chatId;
  late DatabaseReference messagesRef;

  @override
  void initState() {
    super.initState();
    chatId = currentUser.uid.compareTo(widget.otherUserId) < 0
        ? "${currentUser.uid}_${widget.otherUserId}"
        : "${widget.otherUserId}_${currentUser.uid}";
    messagesRef = FirebaseDatabase.instance.ref("messages/$chatId");
  }

  void sendMessage() {
    if (_msgController.text.trim().isEmpty) return;

    final msgRef = messagesRef.push();
    msgRef.set({
      "senderId": currentUser.uid,
      "text": _msgController.text.trim(),
      "timestamp": DateTime.now().millisecondsSinceEpoch,
    });
    _msgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.otherUserName)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: messagesRef.orderByChild("timestamp").onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
                  return Center(child: Text("No messages"));
                }

                Map msgs = snapshot.data!.snapshot.value as Map;
                List<Map> msgList = msgs.entries
                    .map((e) => e.value as Map)
                    .toList()
                  ..sort((a, b) => a["timestamp"].compareTo(b["timestamp"]));

                return ListView.builder(
                  itemCount: msgList.length,
                  itemBuilder: (context, index) {
                    final msg = msgList[index];
                    final isMe = msg["senderId"] == currentUser.uid;
                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue[100] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(msg["text"] ?? ""),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _msgController)),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
