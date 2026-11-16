import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/insights_data.dart';
import '../../domain/usecases/get_insights_data_usecase.dart';

abstract class InsightsState extends Equatable {
  const InsightsState();

  @override
  List<Object?> get props => [];
}

class InsightsInitial extends InsightsState {}

class InsightsLoading extends InsightsState {}

class InsightsLoaded extends InsightsState {
  final InsightsData data;
  final String activePeriod;

  const InsightsLoaded({required this.data, required this.activePeriod});

  InsightsLoaded copyWith({InsightsData? data, String? activePeriod}) {
    return InsightsLoaded(
      data: data ?? this.data,
      activePeriod: activePeriod ?? this.activePeriod,
    );
  }

  @override
  List<Object?> get props => [data, activePeriod];
}

class InsightsError extends InsightsState {
  final String message;

  const InsightsError(this.message);

  @override
  List<Object?> get props => [message];
}

class InsightsCubit extends Cubit<InsightsState> {
  final GetInsightsDataUseCase getInsightsDataUseCase;

  InsightsCubit({required this.getInsightsDataUseCase})
    : super(InsightsInitial());

  Future<void> loadInsights({String period = AppStrings.periodToday}) async {
    if (state is InsightsLoaded) return;
    emit(InsightsLoading());
    try {
      final data = await getInsightsDataUseCase(period);
      emit(InsightsLoaded(data: data, activePeriod: period));
    } catch (e) {
      emit(InsightsError(e.toString()));
    }
  }

  void selectPeriod(String period) {
    if (state is InsightsLoaded) {
      final current = state as InsightsLoaded;
      emit(current.copyWith(activePeriod: period));
    } else {
      loadInsights(period: period);
    }
  }
}
