class MaschineEntity {
  MaschineEntity(
      {required this.id,
      required this.title,
      this.description,
      required this.balance,
      required this.costOfCoffee});

  final int id;
  final String title;
  final String? description;
  final double balance;
  final double costOfCoffee;
}
