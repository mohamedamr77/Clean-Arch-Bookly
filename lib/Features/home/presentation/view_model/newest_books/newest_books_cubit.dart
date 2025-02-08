import 'package:cleanarchcleanarchbookly/Features/home/presentation/view_model/newest_books/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/useCases/fetch_newest_book_use_case.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitialState());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> getNewestBooks()async{
    emit(NewestBooksLoadingState());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailureState(errorMessage: failure.errorMessage));
    },(r) {
      emit(NewestBooksSuccessState());
    },);
  }
}
