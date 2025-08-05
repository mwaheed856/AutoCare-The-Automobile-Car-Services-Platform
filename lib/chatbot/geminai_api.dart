import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String apiKey = 'YOUR API KEY'; // Replace with your API key

  Future<String> askGemini(String question) async {
    final url = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'X-goog-api-key': apiKey,  // API key goes in this header
      },
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text": question,
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      print("areeb");
      final data = jsonDecode(response.body);
      // Extract text from the first candidate part
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      return 'Error: ${response.statusCode} ${response.reasonPhrase}';
    }
  }
}

