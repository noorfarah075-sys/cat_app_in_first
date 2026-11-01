// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactModel _$FactModelFromJson(Map<String, dynamic> json) => FactModel(
  fact: json['fact'] as String,
  length: (json['length'] as num).toInt(),
);

Map<String, dynamic> _$FactModelToJson(FactModel instance) => <String, dynamic>{
  'fact': instance.fact,
  'length': instance.length,
};
