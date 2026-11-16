import '../../domain/entities/home_data.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.profile,
    required super.cosmicTime,
    required super.horoscope,
    required super.numerology,
    required super.hasGoals,
  });

  factory HomeDataModel.mock() {
    return const HomeDataModel(
      profile: UserProfile(
        name: 'Saniya',
        greeting: 'Good Evening',
        traits: 'Air • Mutable • Mercury',
        notificationCount: 8,
      ),
      cosmicTime: CosmicTime(
        years: 22,
        months: 8,
        days: 20,
        hours: 14,
        minutes: 35,
        seconds: 12,
      ),
      horoscope: HoroscopeData(
        sign: 'Gemini',
        date: '15 August 2024',
        advice: 'Your natural curiosity is your strength today. Stay open to new ideas, but give yourself time to focus before making decisions.',
      ),
      numerology: NumerologyData(
        luckyNumber: 5,
        guidance: 'Stay open to unexpected opportunities. Trust your instincts, explore something new, and avoid overthinking your next move.',
      ),
      hasGoals: false,
    );
  }
}
