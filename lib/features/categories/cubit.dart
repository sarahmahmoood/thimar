import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semar/features/categories/states.dart';

import 'model.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesStates());

  Future<void> getData() async {
    emit(GetCategoriesLoadingState());
    final response =
        await Dio().get("https://thimar.amr.aait-d.com/api/categories");
    CategoriesData model = CategoriesData.fromJson(response.data);
    emit(GetCategoriesSuccessState(list: model.list));
  }
}
