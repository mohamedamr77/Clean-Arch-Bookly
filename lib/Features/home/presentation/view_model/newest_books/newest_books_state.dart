abstract class NewestBooksState{}
class NewestBooksInitialState extends NewestBooksState{}
class NewestBooksLoadingState extends NewestBooksState{}
class NewestBooksFailureState extends NewestBooksState{
  final String errorMessage;

  NewestBooksFailureState({required this.errorMessage});
}
class NewestBooksSuccessState extends NewestBooksState{}