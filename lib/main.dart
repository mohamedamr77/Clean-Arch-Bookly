import 'package:cleanarchcleanarchbookly/Features/home/data/repo/home_repo_impl.dart';
import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarchcleanarchbookly/core/utils/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/home/domain/useCases/fetch_feature_books_use_case.dart';
import 'Features/home/presentation/view_model/feature_books/feature_books_cubit.dart';
import 'constants.dart';
import 'core/utils/app_box.dart';
import 'core/utils/app_router.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());

  await Hive.openBox<BookEntity>(BoxApp.kFeaturedBookBox);
  await Hive.openBox<BookEntity>(BoxApp.kNewestBookBox);
  await Hive.box<BookEntity>(BoxApp.kFeaturedBookBox).clear();
  await Hive.box<BookEntity>(BoxApp.kNewestBookBox).clear();
  serviceLocator();

  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeatureBooksCubit(FetchFeatureBooksUseCase(
           getIt.get<HomeRepoImpl>()
      )
      )..fetchFeatureBooks(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
