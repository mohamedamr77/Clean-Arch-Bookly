import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  final List<BookEntity> books;
  const FeaturedBooksListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * .3,
      child:ListView.builder(
          itemCount: books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(imagePath: books[index].image??"",),
            );
          }),
    );
  }
}
