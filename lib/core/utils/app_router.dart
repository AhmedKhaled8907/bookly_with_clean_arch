import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_with_clean_arch/Features/search/domain/use_cases/fetch_search_books_use_case.dart';
import 'package:bookly_with_clean_arch/Features/search/presentation/manger/cubit/search_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import '../../Features/home/presentation/manger/cubits/similar_books_bloc/similar_books_bloc.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import 'functions/setup_service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(
            FetchSearchBooksUseCase(
              getIt.get<SearchRepoImpl>(),
            ),
          ),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            FetchSimilarBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchSimilarBooks(),
          child: BookDetailsView(
            book: state.extra as BookEntity,
          ),
        ),
      ),
    ],
  );
}
