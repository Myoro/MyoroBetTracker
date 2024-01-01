class BetModel {
  final String? name;
  final String? sport;
  final double placed;
  final double gainedOrLost;
  final DateTime? datePlaced;

  BetModel({
    this.name,
    this.sport,
    required this.placed,
    required this.gainedOrLost,
    this.datePlaced
  });

  List<dynamic> toList() => [ name, sport, placed, gainedOrLost, datePlaced ];
}