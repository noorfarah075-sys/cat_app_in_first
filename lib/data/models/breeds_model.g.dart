// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedsModel _$BreedsModelFromJson(Map<String, dynamic> json) => BreedsModel(
  breeds: json['breed'] as String,
  country: json['country'] as String,
  origin: json['origin'] as String,
  coat: json['coat'] as String,
  pattern: json['pattern'] as String,
);

Map<String, dynamic> _$BreedsModelToJson(BreedsModel instance) =>
    <String, dynamic>{
      'breed': instance.breeds,
      'country': instance.country,
      'origin': instance.origin,
      'coat': instance.coat,
      'pattern': instance.pattern,
    };
