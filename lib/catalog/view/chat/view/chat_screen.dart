import 'package:aia_mobile_test_flutter/app/app_routes.dart';
import 'package:aia_mobile_test_flutter/catalog/view/gpt/bloc/chat_gpt_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../../../../common/helper/flutter_toast_helper.dart';
import '../../../../out-buildings/dependency_injector.dart';
import 'components/custom_input_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = "ChatScreen";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final types.User _user = const types.User(id: 'user-id');

  late ChatGPTBloc _chatGPTBloc;
  final FlutterTts flutterTts = FlutterTts();
  String? _speakingMessageId;
  int _currentWordIndex = -1;
  List<String> _words = [];
  @override
  void initState() {
    super.initState();
    _chatGPTBloc = getIt<ChatGPTBloc>();
    _initTTS();
  }


  void _initTTS() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);

    flutterTts.setStartHandler(() async {
      // Estimate time per word
      const wordDelay = Duration(milliseconds: 450); // adjust for speed

      for (int i = 0; i < _words.length; i++) {
        await Future.delayed(wordDelay);
        setState(() {
          _currentWordIndex = i;
        });
      }
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        _currentWordIndex = -1;
        _speakingMessageId = null;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        _currentWordIndex = -1;
        _speakingMessageId = null;
      });
    });
  }
  @override
  void dispose() {
    _chatGPTBloc.close();
    super.dispose();
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

    _chatGPTBloc.add(ChatGPT(text: message.text));
    // _simulateBotResponse(message.text);
  }

  Future<void> _speakWithHighlight(String text) async {
    await flutterTts.stop();
    setState(() {
      _words = text.split(' ');
      _currentWordIndex = -1;
    });

    await flutterTts.speak(text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AIA Chat"),leading: const SizedBox.shrink(),actions: [
        TextButton(onPressed: (){
          Navigator.pushNamed(context, AppRoutes.aboutScreen);
        }, child: const Text("About me",style: TextStyle(color: Colors.black45),))
      ],),
        floatingActionButton: _speakingMessageId != null
            ? Padding(
               padding: const EdgeInsets.only(bottom: 80),
              child: FloatingActionButton.extended(
                        onPressed: () async {
              await flutterTts.stop();
              setState(() {
                _speakingMessageId = null;
                _currentWordIndex = -1;
              });
                        },
                        icon: const Icon(Icons.stop),
                        label: const Text('Stop'),
                        backgroundColor: Colors.redAccent,
                      ),
            )
            : null,
      body:BlocListener<ChatGPTBloc, ChatGPTState>(
        bloc: _chatGPTBloc,
        listener: (context,state) async {
          if(state is ChatGPTError){
            FlutterToastHelper.showErrorFlutterToast(context: context, message: state.message ?? "Error while connecting with ChatGPT");
          }else if(state is ChatGPTLoaded){
            final botMessage = types.TextMessage(
              author: const types.User(id: 'bot-id'),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: const Uuid().v4(),
              text: state.reply,
            );
            _speakingMessageId = botMessage.id;
            print("!231 23k1 23k k ${_speakingMessageId}");
            _messages.insert(0, botMessage);
            _speakWithHighlight(state.reply);
          }else if(state is ChatGPTLoading){
            await flutterTts.stop(); // stop if it's already talking
          }
          setState(() {});
        },
        child: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          theme: const DefaultChatTheme(
            primaryColor: Color(0xffe10087)
          ),
          customBottomWidget: CustomInputWidget(
            isLoading: _chatGPTBloc.state is ChatGPTLoading,
            theme: const DefaultChatTheme(),
            onSendPressed: _handleSendPressed,
            options:  const InputOptions(

            ),
            isListeningCallback: (isListening) async {
              if(isListening){
                await flutterTts.stop(); // stop if it's already talking
              }
            },
          ),
        ),
      )
    );
  }


}