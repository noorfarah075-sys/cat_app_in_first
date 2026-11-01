import 'package:cat_app/domain/entities/fact_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'fact_model.g.dart';
@JsonSerializable()

class FactModel extends FactEntity{
  FactModel({required super.fact, required super.length});

  factory FactModel.fromJson(Map<String, dynamic> json) =>_$FactModelFromJson(json);
  Map<String, dynamic> toJson() =>_$FactModelToJson(this);
  }
