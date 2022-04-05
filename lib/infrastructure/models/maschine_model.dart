import 'package:coffee_counter/domain/entities/maschine_entity.dart';

class MaschineModel extends MaschineEntity {
  MaschineModel(
      {id,
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

  MaschineModel copy({
    int? id,
    String? title,
    String? description,
    double? balance,
    double? costOfCoffee,
  }) =>
      MaschineModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        balance: balance ?? this.balance,
        costOfCoffee: costOfCoffee ?? this.costOfCoffee,
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "balance": balance,
      "costOfCoffee": costOfCoffee
    };
  }
}
