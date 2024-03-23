import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/base/di/app_dependencies.dart';
import 'package:news_app/base/routes/routes.dart';
import 'package:news_app/base/theme/theme.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/theme_switch/theme_switch_bloc.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/theme_switch/theme_switch_event.dart';
import 'package:news_app/features/feature_daily_news/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticleBloc>(
          create: (context) => instance()..add(const GetArticles()),
        ),
        BlocProvider<ThemeSwitchBloc>(
          create: (context) => ThemeSwitchBloc()..add(SetInitialTheme()),
        ),
      ],
      child: BlocBuilder<ThemeSwitchBloc, ThemeData>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state == ThemeData.dark() ? darkTheme : lightTheme,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const HomePage(),
        );
      }),
    );
  }
}
