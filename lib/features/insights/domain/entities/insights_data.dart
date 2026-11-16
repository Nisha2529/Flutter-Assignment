import 'package:equatable/equatable.dart';

class AstrologicalProfile extends Equatable {
  final String userName;
  final String birthInfo;
  final String sunSign;
  final String moonSign;
  final String heroSign;

  const AstrologicalProfile({
    required this.userName,
    required this.birthInfo,
    required this.sunSign,
    required this.moonSign,
    required this.heroSign,
  });

  @override
  List<Object?> get props => [userName, birthInfo, sunSign, moonSign, heroSign];
}

class InsightsData extends Equatable {
  final String selectedPeriod;
  final AstrologicalProfile profile;
  final String focusOfTheDay;
  final String horoscopeText;
  final String favourableDirection;
  final String luckyColour;
  final String funFacts;
  final int luckyNumber;
  final String numerologyGuidance;
  final int destinyNumber;
  final String destinyTitle;

  const InsightsData({
    required this.selectedPeriod,
    required this.profile,
    required this.focusOfTheDay,
    required this.horoscopeText,
    required this.favourableDirection,
    required this.luckyColour,
    required this.funFacts,
    required this.luckyNumber,
    required this.numerologyGuidance,
    required this.destinyNumber,
    required this.destinyTitle,
  });

  @override
  List<Object?> get props => [
    selectedPeriod,
    profile,
    focusOfTheDay,
    horoscopeText,
    favourableDirection,
    luckyColour,
    funFacts,
    luckyNumber,
    numerologyGuidance,
    destinyNumber,
    destinyTitle,
  ];
}
