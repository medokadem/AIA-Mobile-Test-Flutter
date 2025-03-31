part of 'chat_gpt_bloc.dart';

abstract class ChatGPTState extends Equatable {

  const ChatGPTState();

  @override
  List<Object?> get props => [];

}

class ChatGPTInitial extends ChatGPTState {}

class ChatGPTLoading extends ChatGPTState {}

class ChatGPTLoaded extends ChatGPTState {
  final String reply;
  const ChatGPTLoaded(this.reply);
}

class ChatGPTError extends ChatGPTState {
  final String? message;
  const ChatGPTError(this.message);
}