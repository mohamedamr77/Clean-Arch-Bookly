import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  final List<BookEntity> books;
  const NewestBooksListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(bookEntity: books[index],),
        );
      },
    );
  }
}
