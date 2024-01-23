import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_model.freezed.dart';
part 'author_model.g.dart';

@freezed
class AuthorModel with _$AuthorModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const AuthorModel._();
  factory AuthorModel(
    int id,
    String picture,
    String firstName,
    String lastName,
    String email,
  ) = _AuthorModel;

  String get name {
    return '$firstName $lastName';
  }

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);
}
