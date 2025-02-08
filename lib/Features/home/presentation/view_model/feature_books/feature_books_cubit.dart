import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarchcleanarchbookly/Features/home/domain/repos/home_repo.dart';
import 'package:cleanarchcleanarchbookly/Features/home/domain/useCases/fetch_feature_books_use_case.dart';
import 'package:cleanarchcleanarchbookly/Features/home/presentation/view_model/feature_books/feature_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.featureBooksUseCase) : super(FeatureBooksInitialState());
  final FetchFeatureBooksUseCase featureBooksUseCase;
  List<BookEntity> bookEntitiesList=[];
  void fetchFeatureBooks() async{
    emit(FeatureBookLoadingState());
    var result =await featureBooksUseCase.call();
      result.fold((failure) {
         emit(FeatureBooksFailureState(errorMessage: failure.errorMessage));
         }, (r) {
          bookEntitiesList = r;
          emit(FeatureBooksSuccessState());
      },);
  }
}
