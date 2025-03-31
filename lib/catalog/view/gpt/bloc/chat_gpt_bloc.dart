import 'package:aia_mobile_test_flutter/catalog/service/chatgpt/chat_gpt_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'chat_gpt_event.dart';
part 'chat_gpt_state.dart';

class ChatGPTBloc extends Bloc<ChatGPTEvent, ChatGPTState> {

  final ChatGPTService chatGPTService;
  ChatGPTBloc({
    required this.chatGPTService,
  })  : super(ChatGPTInitial()) {
    on<ChatGPT>(_onChatGPT);
  }

  Future<void> _onChatGPT(ChatGPT event, emit) async {
    try {
      emit(ChatGPTLoading());

      try {
        final reply = await chatGPTService.sendMessage(event.text);
        emit(ChatGPTLoaded(reply));
      } catch (e) {
        emit(ChatGPTError(e.toString()));
      }
    } catch (e) {
      print(e.toString());
      emit(ChatGPTError("general_error".tr()));
    }
  }

}
