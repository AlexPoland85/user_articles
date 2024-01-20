import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel {
  const AuthorModel({
    required this.id,
    required this.picture,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
  });

  final int id;
  final String picture;
  final String firstName;
  final String lastName;

  String get name {
    return '$firstName $lastName';
  }

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
