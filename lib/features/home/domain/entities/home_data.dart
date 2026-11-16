import 'package:equatable/equatable.dart';

import '../../../../core/entities/numerology_data.dart';

export '../../../../core/entities/numerology_data.dart';

class UserProfile extends Equatable {
  final String name;
  final String greeting;
  final String traits;
  final int notificationCount;

  const UserProfile({
    required this.name,
    required this.greeting,
    required this.traits,
    required this.notificationCount,
  });

  @override
  List<Object?> get props => [name, greeting, traits, notificationCount];
}

class CosmicTime extends Equatable {
  final int years;
  final int months;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  const CosmicTime({
    required this.years,
    required this.months,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  List<Object?> get props => [years, months, days, hours, minutes, seconds];
}

class HoroscopeData extends Equatable {
  final String sign;
  final String date;
  final String advice;

  const HoroscopeData({
    required this.sign,
    required this.date,
    required this.advice,
  });

  @override
  List<Object?> get props => [sign, date, advice];
}

class HomeData extends Equatable {
  final UserProfile profile;
  final CosmicTime cosmicTime;
  final HoroscopeData horoscope;
  final NumerologyData numerology;
  final bool hasGoals;

  const HomeData({
    required this.profile,
    required this.cosmicTime,
    required this.horoscope,
    required this.numerology,
    required this.hasGoals,
  });

  @override
  List<Object?> get props => [
    profile,
    cosmicTime,
    horoscope,
    numerology,
    hasGoals,
  ];
}
