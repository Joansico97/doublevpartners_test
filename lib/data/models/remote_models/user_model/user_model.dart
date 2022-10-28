import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prueba_flutter/data/models/remote_models/location_model/location_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? name,
    String? lastName,
    String? email,
    List<LocationModel>? locations,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
