import 'package:freezed_annotation/freezed_annotation.dart';

part 'tank_type_model.freezed.dart';
part 'tank_type_model.g.dart';

@freezed
class TankTypesResponse with _$TankTypesResponse {
  const factory TankTypesResponse({
    @Default(false) bool success,
    required TankTypesData data,
  }) = _TankTypesResponse;

  factory TankTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$TankTypesResponseFromJson(json);
}

@freezed
class TankTypesData with _$TankTypesData {
  const factory TankTypesData({
    @Default([]) List<TankType> tankTypes,
  }) = _TankTypesData;

  factory TankTypesData.fromJson(Map<String, dynamic> json) =>
      _$TankTypesDataFromJson(json);
}

@freezed
class TankType with _$TankType {
  const factory TankType({
    required String id,
    required String name,
    required String shape,
    @Default([]) List<TankSize> predefSizes,
  }) = _TankType;

  factory TankType.fromJson(Map<String, dynamic> json) =>
      _$TankTypeFromJson(json);
}

@freezed
class TankSize with _$TankSize {
  const factory TankSize({
    required String id,
    required String tankTypeId,
    required int capacityLiter,
    required int diameterMm,
    required int heightMm,
  }) = _TankSize;

  factory TankSize.fromJson(Map<String, dynamic> json) =>
      _$TankSizeFromJson(json);
}
