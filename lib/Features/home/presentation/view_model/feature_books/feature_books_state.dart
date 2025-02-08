abstract class FeatureBooksState{}

class FeatureBooksInitialState extends FeatureBooksState{}
class FeatureBookLoadingState extends FeatureBooksState{}
class FeatureBooksSuccessState extends FeatureBooksState{}
class FeatureBooksFailureState extends FeatureBooksState{
  final String errorMessage;

  FeatureBooksFailureState({required this.errorMessage});

}