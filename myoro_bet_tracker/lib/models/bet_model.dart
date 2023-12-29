class BetModel {
  final int id;
  double placed;
  double won;

  BetModel({ this.id = 0, this.placed = 0, this.won = 0 });

  BetModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] ?? 0,
      placed = json['placed'] != null ? double.parse(double.parse(json['placed']).toStringAsFixed(2)) : 0,
      won = json['won'] != null ? double.parse(double.parse(json['won']).toStringAsFixed(2)) : 0;
}