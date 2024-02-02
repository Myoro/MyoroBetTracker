import 'package:equatable/equatable.dart';

class BetModel extends Equatable {
  final String? name;
  final String? sport;
  final double placed;
  final double gainedOrLost;
  final String datePlaced;

  const BetModel({
    this.name,
    this.sport,
    required this.placed,
    required this.gainedOrLost,
    required this.datePlaced,
  });

  BetModel.fromJSON(Map<String, dynamic> json)
      : name = json['name'],
        sport = json['sport'],
        placed = double.parse(json['placed']),
        gainedOrLost = double.parse(json['gained_or_lost']),
        datePlaced = json['date_placed'];

  Map<String, dynamic> toJSON() => {
        'name': name,
        'sport': sport,
        'placed': placed.toStringAsFixed(2),
        'gained_or_lost': gainedOrLost.toStringAsFixed(2),
        'date_placed': datePlaced,
      };

  @override
  List<Object?> get props => [
    name,
    sport,
    placed,
    gainedOrLost,
    datePlaced,
  ];
}
