import 'package:coffee_counter/domain/entities/maschine_entity.dart';

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

  MaschineModel copy({
    int? id,
    String? name,
    String? location,
    double? balance,
    double? costOfACoffee,
  }) =>
      MaschineModel(
        id: id ?? this.id,
        title: name ?? this.title,
        description: location ?? this.description,
        balance: balance ?? this.balance,
        costOfCoffee: costOfACoffee ?? this.costOfCoffee,
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
