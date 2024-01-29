class BetModel {
  final String? name;
  final String? sport;
  final double placed;
  final double gainedOrLost;
  final String datePlaced;

  BetModel({
    this.name,
    this.sport,
    required this.placed,
    required this.gainedOrLost,
    required this.datePlaced,
  });
}
