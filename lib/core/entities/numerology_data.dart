import 'package:equatable/equatable.dart';

class NumerologyData extends Equatable {
  final int luckyNumber;
  final String guidance;

  const NumerologyData({required this.luckyNumber, required this.guidance});

  @override
  List<Object?> get props => [luckyNumber, guidance];
}
