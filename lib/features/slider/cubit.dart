import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semar/features/slider/states.dart';

import 'model.dart';

class SliderCubit extends Cubit<SliderStates> {
  SliderCubit() : super(SliderStates());

  Future<void> getData() async {
    emit(GetSliderLoadingState());
    final response =
        await Dio().get("https://thimar.amr.aait-d.com/api/sliders");
    SliderData model = SliderData.fromJson(response.data);
    emit(GetSliderSuccessState(list: model.list));
  }
}
