import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_model.freezed.dart';
part 'details_model.g.dart';

@freezed
class DetailsModel with _$DetailsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory DetailsModel(
    int id,
    int authorId,
    String title,
    String content,
  ) = _DetailsModel;

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);
}
