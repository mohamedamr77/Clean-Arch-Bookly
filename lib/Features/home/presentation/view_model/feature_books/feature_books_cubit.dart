import 'package:cleanarchcleanarchbookly/Features/home/presentation/view_model/feature_books/feature_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit() : super(FeatureBooksInitialState());

}
