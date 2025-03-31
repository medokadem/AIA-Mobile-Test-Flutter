part of 'chat_gpt_bloc.dart';

abstract class ChatGPTEvent extends Equatable {
  const ChatGPTEvent();

  @override
  List<Object> get props => [];
}

class ChatGPT extends ChatGPTEvent {
  final String text;
  const ChatGPT({required this.text});
}