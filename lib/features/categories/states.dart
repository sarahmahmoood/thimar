import 'model.dart';

class CategoriesStates {}

class GetCategoriesLoadingState extends CategoriesStates {}

class GetCategoriesSuccessState extends CategoriesStates {

  final List<CategoriesModel> list;

  GetCategoriesSuccessState({required this.list});
}

class GetCategoriesFailedState extends CategoriesStates {}
