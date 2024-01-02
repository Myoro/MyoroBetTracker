import 'package:intl/intl.dart';

class BetModel {
  final String? name;
  final String? sport;
  final double placed;
  final dynamic gainedOrLost;
  final DateTime? datePlaced;

  BetModel({
    this.name,
    this.sport,
    required this.placed,
    required this.gainedOrLost,
    this.datePlaced
  });

  Map<String, dynamic> toJSON() => {
    'name': name,
    'sport': sport,
    'placed': placed,
    'gained_or_lost': gainedOrLost,
    'date_placed': datePlaced != null ? DateFormat('dd-MM-yyyy').format(datePlaced!) : null
  };

  BetModel.fromJSON(Map<String, dynamic> json)
    : name = json['name'],
      sport = json['sport'],
      placed = json['placed'],
      gainedOrLost = json['gained_or_lost'],
      datePlaced = json['date_placed'];

  List<dynamic> toList() => [
    name,
    sport,
    placed,
    gainedOrLost,
    datePlaced != null ? DateFormat('mm-MM-yyyy').format(datePlaced!) : ''
  ];
}