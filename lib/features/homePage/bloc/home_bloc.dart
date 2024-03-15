
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ice_cream_shop/model/popular_item.dart';
import 'package:meta/meta.dart';

import '../productModel/model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit)async {
    print("loading");
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
emit(HomeLoadedState());
  }
}
