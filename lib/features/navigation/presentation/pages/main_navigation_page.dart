import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment/features/goals/presentation/pages/goals_page.dart';
import 'package:flutter_assignment/features/home/presentation/pages/home_page.dart';
import 'package:flutter_assignment/features/journal/presentation/pages/journal_page.dart';
import 'package:flutter_assignment/features/insights/presentation/pages/insights_page.dart';
import 'package:flutter_assignment/features/navigation/cubit/navigation_cubit.dart';
import 'package:flutter_assignment/features/navigation/presentation/widgets/custom_bottom_nav_bar.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  static const List<Widget> _pages = [
    HomePage(),
    GoalsPage(),
    JournalPage(),
    InsightsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: IndexedStack(index: state.selectedIndex, children: _pages),
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: state.selectedIndex,
            onItemSelected: (index) {
              context.read<NavigationCubit>().setTab(index);
            },
          ),
        );
      },
    );
  }
}
