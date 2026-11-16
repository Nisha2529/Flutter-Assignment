import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_assignment/core/constants/app_strings.dart';
import 'package:flutter_assignment/core/entities/numerology_data.dart';
import 'package:flutter_assignment/core/widgets/numerology_card_widget.dart';
import 'package:flutter_assignment/features/home/domain/entities/home_data.dart';
import 'package:flutter_assignment/features/insights/domain/entities/insights_data.dart';
import 'package:flutter_assignment/features/insights/presentation/widgets/astrological_hero_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/home_cubit.dart';
import 'package:flutter_assignment/features/home/presentation/pages/home_page.dart';
import 'package:flutter_assignment/features/journal/presentation/bloc/journal_cubit.dart';
import 'package:flutter_assignment/features/journal/presentation/pages/journal_page.dart';
import 'package:flutter_assignment/features/insights/presentation/bloc/insights_cubit.dart';
import 'package:flutter_assignment/features/insights/presentation/pages/insights_page.dart';
import 'package:flutter_assignment/features/navigation/cubit/navigation_cubit.dart';
import 'package:flutter_assignment/main.dart';
import 'package:flutter_assignment/injection_container.dart' as di;

void main() {
  setUp(() async {
    await di.init();
  });

  tearDown(() async {
    await di.sl.reset();
  });

  testWidgets(
    'Full smoke test - verifies navigation across Home, Goals, Journal, and Insights tabs',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      // Pump frames for async loading & initial animations
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 300));

      // 1. Verify Home Screen loaded
      expect(find.text('Saniya'), findsOneWidget);
      expect(find.text(AppStrings.noGoalsYet), findsOneWidget);
      expect(find.text(AppStrings.todaysHoroscope), findsOneWidget);
      expect(find.text(AppStrings.todaysNumerology), findsOneWidget);

      // Verify scrolling on Home page keeps AppBar intact and scrolls cards
      await tester.drag(
        find.byType(SingleChildScrollView).first,
        const Offset(0, -200),
      );
      await tester.pumpAndSettle();
      expect(find.text('Saniya'), findsOneWidget);

      // 2. Navigate to Goals Tab
      await tester.tap(find.text(AppStrings.navGoals));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text(AppStrings.yourJourneyStartsHere), findsOneWidget);

      // 3. Navigate to Journal Tab
      await tester.tap(find.text(AppStrings.navJournal));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text(AppStrings.yourJournal), findsOneWidget);
      expect(find.text(AppStrings.recentEntries), findsOneWidget);
      expect(find.text('A Day To Remember'), findsOneWidget);

      // 4. Navigate to Insights Tab
      await tester.tap(find.text(AppStrings.navInsights).last);
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 300));

      // Both the page title and bottom nav label are "Insights"
      expect(find.text(AppStrings.insights), findsNWidgets(2));
      expect(find.text('Gilli Gaurav Singh'), findsOneWidget);
      expect(find.text(AppStrings.astrology), findsOneWidget);
      expect(find.text(AppStrings.numerology), findsOneWidget);
      // Verify that "TODAY'S NUMEROLOGY" header is hidden on Insights page
      expect(find.text(AppStrings.todaysNumerology), findsNothing);
    },
  );

  testWidgets('NumerologyCardWidget shows header conditionally', (
    WidgetTester tester,
  ) async {
    const data = NumerologyData(luckyNumber: 7, guidance: 'Test guidance');

    // Test with showHeader = true (default)
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(402, 874),
        builder: (_, child) => MaterialApp(home: Scaffold(body: child)),
        child: const NumerologyCardWidget(numerology: data),
      ),
    );
    expect(find.text(AppStrings.todaysNumerology), findsOneWidget);

    // Test with showHeader = false
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(402, 874),
        builder: (_, child) => MaterialApp(home: Scaffold(body: child)),
        child: const NumerologyCardWidget(numerology: data, showHeader: false),
      ),
    );
    expect(find.text(AppStrings.todaysNumerology), findsNothing);
  });

  for (final width in [320.0, 375.0, 402.0, 600.0, 800.0]) {
    testWidgets(
      'AstrologicalHeroCard responsive validation at width ${width.toInt()}px',
      (WidgetTester tester) async {
        tester.view.physicalSize = Size(width, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ScreenUtilInit(
            designSize: const Size(402, 874),
            minTextAdapt: true,
            splitScreenMode: true,
            fontSizeResolver: (fontSize, instance) =>
                fontSize * instance.scaleText,
            builder: (_, child) => MaterialApp(
              home: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: child,
                ),
              ),
            ),
            child: const AstrologicalHeroCard(
              profile: AstrologicalProfile(
                userName: 'Gilli Gaurav Singh',
                birthInfo: 'You • Sept 23, 2003',
                sunSign: 'Cancer',
                moonSign: 'Leo',
                heroSign: 'Leo',
              ),
            ),
          ),
        );
        await tester.pump();

        expect(
          tester.takeException(),
          isNull,
          reason: 'AstrologicalHeroCard must not overflow at $width',
        );
        expect(find.text('Gilli Gaurav Singh'), findsOneWidget);
        expect(find.text(AppStrings.cancer), findsOneWidget);
        expect(find.text(AppStrings.leo), findsNWidgets(2));
      },
    );

    testWidgets(
      'HomePage responsive layout validation at width ${width.toInt()}px',
      (WidgetTester tester) async {
        tester.view.physicalSize = Size(width, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ScreenUtilInit(
            designSize: const Size(402, 874),
            minTextAdapt: true,
            splitScreenMode: true,
            fontSizeResolver: (fontSize, instance) =>
                fontSize * instance.scaleText,
            builder: (_, child) => MultiBlocProvider(
              providers: [
                BlocProvider<NavigationCubit>(
                  create: (_) => di.sl<NavigationCubit>(),
                ),
                BlocProvider<HomeCubit>(create: (_) => di.sl<HomeCubit>()),
              ],
              child: MaterialApp(home: Scaffold(body: child)),
            ),
            child: const HomePage(),
          ),
        );
        await tester.pump(const Duration(milliseconds: 200));
        await tester.pump(const Duration(milliseconds: 300));

        expect(
          tester.takeException(),
          isNull,
          reason: 'HomePage must not overflow at $width',
        );

        // Verify Home screen cards loaded and visible
        expect(find.text('Saniya'), findsOneWidget);
        expect(find.text(AppStrings.noGoalsYet), findsOneWidget);
        expect(find.text(AppStrings.todaysHoroscope), findsOneWidget);
        expect(find.text(AppStrings.todaysNumerology), findsOneWidget);
      },
    );

    testWidgets(
      'JournalPage responsive layout validation at width ${width.toInt()}px',
      (WidgetTester tester) async {
        tester.view.physicalSize = Size(width, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ScreenUtilInit(
            designSize: const Size(402, 874),
            minTextAdapt: true,
            splitScreenMode: true,
            fontSizeResolver: (fontSize, instance) =>
                fontSize * instance.scaleText,
            builder: (_, child) => MultiBlocProvider(
              providers: [
                BlocProvider<JournalCubit>(
                  create: (_) => di.sl<JournalCubit>(),
                ),
              ],
              child: MaterialApp(home: Scaffold(body: child)),
            ),
            child: const JournalPage(),
          ),
        );
        await tester.pump(const Duration(milliseconds: 200));
        await tester.pump(const Duration(milliseconds: 300));

        expect(
          tester.takeException(),
          isNull,
          reason: 'JournalPage must not overflow at $width',
        );
        expect(find.text(AppStrings.yourJournal), findsOneWidget);
      },
    );

    testWidgets(
      'InsightsPage responsive layout validation at width ${width.toInt()}px',
      (WidgetTester tester) async {
        tester.view.physicalSize = Size(width, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          ScreenUtilInit(
            designSize: const Size(402, 874),
            minTextAdapt: true,
            splitScreenMode: true,
            fontSizeResolver: (fontSize, instance) =>
                fontSize * instance.scaleText,
            builder: (_, child) => MultiBlocProvider(
              providers: [
                BlocProvider<InsightsCubit>(
                  create: (_) => di.sl<InsightsCubit>(),
                ),
              ],
              child: MaterialApp(home: Scaffold(body: child)),
            ),
            child: const InsightsPage(),
          ),
        );
        await tester.pump(const Duration(milliseconds: 200));
        await tester.pump(const Duration(milliseconds: 300));

        expect(
          tester.takeException(),
          isNull,
          reason: 'InsightsPage must not overflow at $width',
        );
        expect(find.text(AppStrings.astrology), findsOneWidget);
      },
    );
  }
}
