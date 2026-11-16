import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/bloc/home_cubit.dart';
import 'features/journal/presentation/bloc/journal_cubit.dart';
import 'features/insights/presentation/bloc/insights_cubit.dart';
import 'features/navigation/cubit/navigation_cubit.dart';
import 'features/navigation/presentation/pages/main_navigation_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) => fontSize * instance.scaleText,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>(
              create: (_) => di.sl<NavigationCubit>(),
            ),
            BlocProvider<HomeCubit>(create: (_) => di.sl<HomeCubit>()),
            BlocProvider<JournalCubit>(create: (_) => di.sl<JournalCubit>()),
            BlocProvider<InsightsCubit>(create: (_) => di.sl<InsightsCubit>()),
          ],
          child: MaterialApp(
            title: AppStrings.appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: const MainNavigationPage(),
          ),
        );
      },
    );
  }
}
