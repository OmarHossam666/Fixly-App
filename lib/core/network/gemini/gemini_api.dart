import 'dart:convert';
import 'package:http/http.dart' as http;


const apiKey =
    'AIzaSyAlnzM-un4ceAqQ6ryLOKMb--vw-V283-8';
final endpoint = Uri.parse(
  'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent',
);

Future<Map<String, dynamic>> callGemini(String prompt) async {
  final headers = {
    'Content-Type': 'application/json',
    'X-goog-api-key': apiKey,
  };

  final body = jsonEncode({
    "contents": [
      {
        "role": "user",
        "parts": [
          {
            "text": """
You are a helpful, and energetic chatbot designed to solve the customer problem and give him the appropiate service.
You are a chatbot called Felix in an app called Sala7ly which is a Home Services App.


Your job is to:
- Understand what the customer wants
- Extract service from customer intentions or text
- Reply in a helpful, cheerful, simple way that comfort customers

🔵 ALWAYS respond in **valid JSON format**, possible values "top": "String", "service": "String", exactly like this:

{ 
  "service": "plumber",
  "response": "your friendly chatbot reply here"
}

  📌 Rules:
  - DO NOT explain your format
  - Never wrap the JSON in triple backticks (```)
  - DO NOT include anything outside the JSON block
  - Keep your tone positive, safe, and appropriate
  - Use simple words, emojis are OK too 😊
  - if the user didn't provide a service just say "none"



Now analyze and respond to this message:
""",
          },
        ],
      },
      {
        "role": "user",
        "parts": [
          {"text": prompt},
        ],
      },
    ],
  });

  final response = await http.post(endpoint, headers: headers, body: body);

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    final rawtext = decoded['candidates'][0]['content']['parts'][0]['text'];
    final cleanedContent = rawtext
        .replaceAll(RegExp(r'^```(?:json)?', multiLine: true), '')
        .replaceAll(RegExp(r'```', multiLine: true), '')
        .trim();
    try {
      final parsedJson = jsonDecode(cleanedContent);
      print(parsedJson);
      return parsedJson;
    } catch (e) {
      throw Exception('Gemini did not return valid JSON: $e\n$cleanedContent');
    }
  } else {
    print('Error ${response.statusCode}: ${response.body}');
    throw Exception('Failed to call Gemini');
  }
}
