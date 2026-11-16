import '../../domain/entities/insights_data.dart';

class InsightsDataModel extends InsightsData {
  const InsightsDataModel({
    required super.selectedPeriod,
    required super.profile,
    required super.focusOfTheDay,
    required super.horoscopeText,
    required super.favourableDirection,
    required super.luckyColour,
    required super.funFacts,
    required super.luckyNumber,
    required super.numerologyGuidance,
    required super.destinyNumber,
    required super.destinyTitle,
  });

  factory InsightsDataModel.mock(String period) {
    return InsightsDataModel(
      selectedPeriod: period,
      profile: const AstrologicalProfile(
        userName: 'Gilli Gaurav Singh',
        birthInfo: 'You • Sept 23, 2003',
        sunSign: 'Cancer',
        moonSign: 'Leo',
        heroSign: 'Leo',
      ),
      focusOfTheDay: 'Career',
      horoscopeText: 'Give yourself time to heal and focus on your well-being today. Avoid unhealthy habits and choose nourishing foods. Stay patient - positive career opportunities are on the way, while love brings warmth and connection.',
      favourableDirection: 'North',
      luckyColour: 'Pink',
      funFacts: 'Leo is ruled by the Sun ☀️, which is why it\'s traditionally associated with confidence, creativity, warmth, and a natural desire to shine.',
      luckyNumber: 5,
      numerologyGuidance: 'Stay open to unexpected opportunities. Trust your instincts, explore something new, and avoid overthinking your next move.',
      destinyNumber: 7,
      destinyTitle: 'The Seeker',
    );
  }
}
