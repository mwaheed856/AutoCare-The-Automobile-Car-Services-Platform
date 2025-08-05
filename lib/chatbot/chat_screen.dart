import 'package:flutter/material.dart';
import 'geminai_api.dart';

class GeminiChatScreen extends StatefulWidget {
  @override
  _GeminiChatScreenState createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final GeminiService _geminiService = GeminiService();
  String _response = '';

  void _askQuestion() async {
    final question = _controller.text.trim();
    if (question.isEmpty) return;

    setState(() => _response = 'Loading...');
    final result = await _geminiService.askGemini(question);
    setState(() => _response = result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ask Gemini AI')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Ask your question...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _askQuestion,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_response),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
