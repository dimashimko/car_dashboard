import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required int id,
    required String name,
    required String avatar,
    required bool isTyping,
    required bool isPinned,
    required bool isOnline,
    required List<Message> messages,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
