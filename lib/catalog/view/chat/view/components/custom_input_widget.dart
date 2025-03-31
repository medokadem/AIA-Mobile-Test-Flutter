import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class CustomInputWidget extends StatefulWidget {

  const CustomInputWidget({
    super.key,
    this.isAttachmentUploading,
    this.onAttachmentPressed,
    required this.onSendPressed,
    required this.theme,
    this.isLoading = false,
    this.isListeningCallback,
    this.options = const InputOptions(),
  });

  final bool isLoading;

  final bool? isAttachmentUploading;

  /// See [AttachmentButton.onPressed].
  final VoidCallback? onAttachmentPressed;
  final Function(bool)? isListeningCallback;

  /// Will be called on [SendButton] tap. Has [types.PartialText] which can
  /// be transformed to [types.TextMessage] and added to the messages list.
  final void Function(types.PartialText) onSendPressed;

  /// Customisation options for the [Input].
  final InputOptions options;
  final ChatTheme theme;

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

/// [Input] widget state.
class _CustomInputWidgetState extends State<CustomInputWidget> {
  late final _inputFocusNode = FocusNode(
    onKeyEvent: (node, event) {
      if (event.physicalKey == PhysicalKeyboardKey.enter &&
          !HardwareKeyboard.instance.physicalKeysPressed.any(
                (el) => <PhysicalKeyboardKey>{
              PhysicalKeyboardKey.shiftLeft,
              PhysicalKeyboardKey.shiftRight,
            }.contains(el),
          )) {
        if (kIsWeb && _textController.value.isComposingRangeValid) {
          return KeyEventResult.ignored;
        }
        if (event is KeyDownEvent) {
          _handleSendPressed();
        }
        return KeyEventResult.handled;
      } else {
        return KeyEventResult.ignored;
      }
    },
  );

  bool _sendButtonVisible = false;
  late TextEditingController _textController;

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _voiceText = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

    _textController =
        widget.options.textEditingController ?? InputTextFieldController();
    _handleSendButtonVisibilityModeChange();
  }

  void _handleSendButtonVisibilityModeChange() {
    _textController.removeListener(_handleTextControllerChange);
    if (widget.options.sendButtonVisibilityMode ==
        SendButtonVisibilityMode.hidden) {
      _sendButtonVisible = false;
    } else if (widget.options.sendButtonVisibilityMode ==
        SendButtonVisibilityMode.editing) {
      _sendButtonVisible = _textController.text.trim() != '';
      _textController.addListener(_handleTextControllerChange);
    } else {
      _sendButtonVisible = true;
    }
  }

  void _handleSendPressed() {
    final trimmedText = _textController.text.trim();
    if (trimmedText != '') {
      final partialText = types.PartialText(text: trimmedText);
      widget.onSendPressed(partialText);

      if (widget.options.inputClearMode == InputClearMode.always) {
        _textController.clear();
      }
    }
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print("Speech status: $status"),
      onError: (error) => print("Speech error: $error"),
    );
    if (available) {
      setState(() {
        _isListening = true;
        _voiceText = '';
      });
      _speech.listen(
        onResult: (result) {
          setState(() {
            _voiceText = result.recognizedWords;
          });
        },
      );
    }
    if(widget.isListeningCallback != null){
      widget.isListeningCallback!(_isListening);
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);

    if (_voiceText.trim().isNotEmpty) {
      widget.onSendPressed(types.PartialText(text: _voiceText.trim()));
      _voiceText = '';
    }

    if(widget.isListeningCallback != null){
      widget.isListeningCallback!(_isListening);
    }
  }

  void _handleTextControllerChange() {
    setState(() {
      _sendButtonVisible = _textController.text.trim() != '';
    });
  }

  Widget _inputBuilder() {
    final query = MediaQuery.of(context);
    final buttonPadding = widget.theme
        .inputPadding
        .copyWith(left: 16, right: 16);
    final safeAreaInsets = widget.options.usesSafeArea && (Platform.isIOS || Platform.isAndroid)
        ? EdgeInsets.fromLTRB(
      query.padding.left,
      0,
      query.padding.right,
      query.viewInsets.bottom + query.padding.bottom,
    )
        : EdgeInsets.zero;
    final textPadding = widget
        .theme
        .inputPadding
        .copyWith(left: 0, right: 0)
        .add(
      EdgeInsets.fromLTRB(
        widget.onAttachmentPressed != null ? 0 : 24,
        0,
        _sendButtonVisible ? 0 : 24,
        0,
      ),
    );

    return Focus(
      autofocus: !widget.options.autofocus,
      child: Padding(
        padding: widget.theme.inputMargin,
        child: Material(
          borderRadius: widget.theme.inputBorderRadius,
          color: widget.theme.inputBackgroundColor,
          surfaceTintColor:
          widget.theme.inputSurfaceTintColor,
          elevation: widget.theme.inputElevation,
          child: Container(
            decoration:
            widget.theme.inputContainerDecoration,
            padding: safeAreaInsets,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: widget.isLoading ? 4 : 0,
                    child: const LinearProgressIndicator(
                      color: Colors.yellow,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    if (widget.onAttachmentPressed != null)
                      AttachmentButton(
                        isLoading: widget.isAttachmentUploading ?? false,
                        onPressed: widget.onAttachmentPressed,
                        padding: buttonPadding,
                      ),
                    Expanded(
                      child: Padding(
                        padding: textPadding,
                        child: TextField(
                          enabled: widget.options.enabled,
                          autocorrect: widget.options.autocorrect,
                          autofocus: widget.options.autofocus,
                          enableSuggestions: widget.options.enableSuggestions,
                          controller: _textController,
                          cursorColor: widget
                              .theme
                              .inputTextCursorColor,
                          decoration: widget
                              .theme
                              .inputTextDecoration
                              .copyWith(
                            hintStyle: widget
                                .theme
                                .inputTextStyle
                                .copyWith(
                              color: widget
                                  .theme
                                  .inputTextColor
                                  .withOpacity(0.5),
                            ),
                            hintText: _isListening ? "Listening... ,release to send your record as a text" :"Message",
                          ),
                          focusNode: _inputFocusNode,
                          keyboardType: widget.options.keyboardType,
                          maxLines: 5,
                          minLines: 1,
                          onChanged: widget.options.onTextChanged,
                          onTap: widget.options.onTextFieldTap,
                          style: widget
                              .theme
                              .inputTextStyle
                              .copyWith(
                            color: widget
                                .theme
                                .inputTextColor,
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                    ),
                    // Mic button with animation

                    GestureDetector(
                      onLongPressStart: (_) => _startListening(),
                      onLongPressEnd: (_) => _stopListening(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: _isListening ? Colors.redAccent : Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            _isListening ? Icons.mic : Icons.mic_none,
                            color: _isListening ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: buttonPadding.bottom + buttonPadding.top + 24,
                      ),
                      child: Visibility(
                        visible: _sendButtonVisible,
                        child: SendButton(
                          onPressed: _handleSendPressed,
                          padding: buttonPadding,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  void didUpdateWidget(covariant CustomInputWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.options.sendButtonVisibilityMode !=
        oldWidget.options.sendButtonVisibilityMode) {
      _handleSendButtonVisibilityModeChange();
    }
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    _textController.dispose();
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => _inputFocusNode.requestFocus(),
    child: _inputBuilder(),
  );
}
