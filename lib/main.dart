import 'package:bookly_with_clean_arch/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/home/data/repos/home_repo_impl.dart';
import 'Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

import 'Features/home/presentation/manger/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'Features/home/presentation/manger/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/functions/init_hive.dart';
import 'core/utils/functions/setup_service_locator.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await initHive();
  setupServiceLocator();

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
