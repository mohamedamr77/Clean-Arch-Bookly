import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarchcleanarchbookly/Features/home/presentation/view_model/feature_books/feature_books_cubit.dart';
import 'package:cleanarchcleanarchbookly/Features/home/presentation/view_model/feature_books/feature_books_state.dart';
import 'package:cleanarchcleanarchbookly/Features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:cleanarchcleanarchbookly/Features/home/presentation/view_model/newest_books/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_book_bloc_builder.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedBookBlocBuilder(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: NewestBooksBlocBuilder()
          ),
        ),
      ],
    );
  }
}

class NewestBooksBlocBuilder extends StatelessWidget {
  const NewestBooksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(

      builder: (context, state) {
        List<BookEntity> books = BlocProvider.of<NewestBooksCubit>(context).books;
        return state is NewestBooksLoadingState? CircularProgressIndicator() :
             state is NewestBooksFailureState ? Text(state.errorMessage):
             NewestBooksListView(books: books,);
      },
    );
  }
}
