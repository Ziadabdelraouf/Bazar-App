import 'package:bazar_group_1/features/home/domain/entities/author.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel extends Author{
  const AuthorModel({
    required super.name,
    required super.role,
    required super.image,
  });
  factory AuthorModel.fromJson(Map<String,dynamic>Json)=>_$AuthorModelFromJson(Json);
  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
} 