import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../view_model/feature_books/feature_books_cubit.dart';
import '../../view_model/feature_books/feature_books_state.dart';
import 'featured_list_view.dart';

class FeaturedBookBlocBuilder extends StatelessWidget {
  const FeaturedBookBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        List<BookEntity> books = BlocProvider.of<FeatureBooksCubit>(context).bookEntitiesList;
        return
          state is FeatureBookLoadingState ? CircularProgressIndicator() :
          state is FeatureBooksFailureState ? Text(state.errorMessage):
          FeaturedBooksListView(books: books,);
      },
    );
  }
}
