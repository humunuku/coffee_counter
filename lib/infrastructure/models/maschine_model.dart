import 'package:coffee_counter/domain/entities/maschine_entity.dart';
import 'package:flutter/material.dart';

class MaschineModel extends MaschineEntity {
  MaschineModel(
      {required id,
      required title,
      description,
      required balance,
      required costOfCoffee})
      : super(
            id: id,
            title: title,
            description: description,
            balance: balance,
            costOfCoffee: costOfCoffee);

  factory MaschineModel.fromJson(Map<String, dynamic> json) {
    return MaschineModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        balance: json["balance"],
        costOfCoffee: json["costOfCoffee"]);
  }
}
