import 'package:flutter_bloc/flutter_bloc.dart';

import 'EventsHome.dart';
import 'StatesHome.dart';

class BlocHome extends Bloc<EventsHome, StatesHome> {
  BlocHome() : super(HomeInitial()) {
    on<EventsHome>((event, emit) async {
      if (event is StartHome) {
        // اینجا می‌توانید عملیات مربوط به StartHome را تعریف کنید
       // emit(HomeLoading()); // فرضا به حالت "در حال بارگذاری" تغییر می‌کنید

        emit(
            HomeLoaded()); // بعد از بارگذاری موفق، به حالت "بارگذاری شده" تغییر می‌دهید
      }
    });
  }
}
