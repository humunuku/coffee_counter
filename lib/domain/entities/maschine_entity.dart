class MaschineEntity {
  MaschineEntity(
      {this.id,
      required this.title,
      this.description,
      required this.balance,
      required this.costOfCoffee});

  final int? id;
  final String title;
  final String? description;
  final double balance;
  final double costOfCoffee;

  factory MaschineEntity.fromJson(Map<String, dynamic> json) {
    return MaschineEntity(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        balance: json["balance"],
        costOfCoffee: json["costOfCoffee"]);
  }

  MaschineEntity copy({
    int? id,
    String? title,
    String? description,
    double? balance,
    double? costOfCoffee,
  }) =>
      MaschineEntity(
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
