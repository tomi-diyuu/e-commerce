import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class MUser with _$MUser {
  const MUser._();

  const factory MUser({
    required String id,
    String? name,
    String? avatar,
    String? email,
    @Default([]) List<String> favorites, // productId list
  }) = _MUser;

  factory MUser.empty() {
    return const MUser(id: '');
  }

  factory MUser.fromJson(Map<String, dynamic> json) => _$MUserFromJson(json);
}
