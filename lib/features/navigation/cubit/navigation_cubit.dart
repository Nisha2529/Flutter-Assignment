import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

enum AppTab { home, goals, journal, insights }

class NavigationState extends Equatable {
  final AppTab selectedTab;
  final int selectedIndex;

  const NavigationState({
    this.selectedTab = AppTab.home,
    this.selectedIndex = 0,
  });

  NavigationState copyWith({AppTab? selectedTab, int? selectedIndex}) {
    return NavigationState(
      selectedTab: selectedTab ?? this.selectedTab,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [selectedTab, selectedIndex];
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void setTab(int index) {
    final tab = switch (index) {
      0 => AppTab.home,
      1 => AppTab.goals,
      2 => AppTab.journal,
      3 => AppTab.insights,
      _ => AppTab.home,
    };
    emit(state.copyWith(selectedIndex: index, selectedTab: tab));
  }
}
