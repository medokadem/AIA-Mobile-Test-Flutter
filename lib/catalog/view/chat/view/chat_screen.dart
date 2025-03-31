import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'components/custom_input_widget.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = "ChatScreen";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final types.User _user = const types.User(id: 'user-id');
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _voiceText = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('Status: $val'),
        onError: (val) => print('Error: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _voiceText = val.recognizedWords;
            });

            if (val.hasConfidenceRating && val.confidence > 0.8) {
              _handleSendPressed(types.PartialText(text: _voiceText));
              _speech.stop();
              setState(() => _isListening = false);
            }
          },
        );
      }
    } else {
      _speech.stop();
      setState(() => _isListening = false);
    }
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });

    // You can now pass `message.text` to OpenAI GPT or handle it
    _simulateBotResponse(message.text);
  }

  void _simulateBotResponse(String userText) {
    final botMessage = types.TextMessage(
      author: const types.User(id: 'bot-id'),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: "This is a reply to: $userText",
    );

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.insert(0, botMessage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Chat")),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        customBottomWidget: CustomInputWidget(
          theme: const DefaultChatTheme(),
          onSendPressed: _handleSendPressed,
          options:  const InputOptions(),
        ),
      ),
    );
  }
}