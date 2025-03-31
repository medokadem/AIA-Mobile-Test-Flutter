
import 'package:aia_mobile_test_flutter/common/config/app_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class ChatGPTService {

  ChatGPTService(this.dio);

  final Dio dio;

  Future<String> sendMessage(String userMessage) async {
    const url = 'https://api.openai.com/v1/chat/completions';
    final openAiApiKey = dotenv.env['OPENAI_API_KEY'];

    final response = await dio.post(
      url,
      options: Options(headers: {
        'Authorization': 'Bearer $openAiApiKey',
        'Content-Type': 'application/json',
      }),
      data: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {"role": "user", "content": userMessage}
        ],
        "temperature": 0.7,
      },
    );

    return response.data['choices'][0]['message']['content'].toString().trim();
  }
}
