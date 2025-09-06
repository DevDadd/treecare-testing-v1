// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatStateCWProxy {
  ChatState messages(List<ChatMessage> messages);

  ChatState isLoading(bool isLoading);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ChatState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatState(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatState call({List<ChatMessage> messages, bool isLoading});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatState.copyWith(...)` or call `instanceOfChatState.copyWith.fieldName(value)` for a single field.
class _$ChatStateCWProxyImpl implements _$ChatStateCWProxy {
  const _$ChatStateCWProxyImpl(this._value);

  final ChatState _value;

  @override
  ChatState messages(List<ChatMessage> messages) => call(messages: messages);

  @override
  ChatState isLoading(bool isLoading) => call(isLoading: isLoading);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ChatState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatState(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatState call({
    Object? messages = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return ChatState(
      messages: messages == const $CopyWithPlaceholder() || messages == null
          ? _value.messages
          // ignore: cast_nullable_to_non_nullable
          : messages as List<ChatMessage>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $ChatStateCopyWith on ChatState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatState.copyWith(...)` or `instanceOfChatState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatStateCWProxy get copyWith => _$ChatStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatState _$ChatStateFromJson(Map<String, dynamic> json) => ChatState(
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isLoading: json['isLoading'] as bool? ?? false,
);

Map<String, dynamic> _$ChatStateToJson(ChatState instance) => <String, dynamic>{
  'messages': instance.messages,
  'isLoading': instance.isLoading,
};
