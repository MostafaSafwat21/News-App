abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomState extends NewsState {}

// General
class NewsGetGeneralLoadingState extends NewsState {}
class NewsGetGeneralSuccessState extends NewsState {}
class NewsGetGeneralErrorState extends NewsState {
  final String error;
  NewsGetGeneralErrorState(this.error);
}

// Sports
class NewsSportsLoadingState extends NewsState {}
class NewsSportsSuccessState extends NewsState {}
class NewsSportsErrorState extends NewsState {
  final String error;
  NewsSportsErrorState(this.error);
}

// Business
class NewsBusinessLoadingState extends NewsState {}
class NewsBusinessSuccessState extends NewsState {}
class NewsBusinessErrorState extends NewsState {
  final String error;
  NewsBusinessErrorState(this.error);
}

// Science
class NewsScienceLoadingState extends NewsState {}
class NewsScienceSuccessState extends NewsState {}
class NewsScienceErrorState extends NewsState {
  final String error;
  NewsScienceErrorState(this.error);
}

// Technology
class NewsTechnologyLoadingState extends NewsState {}
class NewsTechnologySuccessState extends NewsState {}
class NewsTechnologyErrorState extends NewsState {
  final String error;
  NewsTechnologyErrorState(this.error);
}