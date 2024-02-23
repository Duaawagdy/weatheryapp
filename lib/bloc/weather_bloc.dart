import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weatheryapp/data/data.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async{
     emit(Weatherloading());
     try{
       WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

       Weather weather = await wf.currentWeatherByLocation(
        event.position.latitude,
         event.position.longitude,
       );
       print(weather);
       emit(Weathersucces(weather));
     }
         catch(e){
       emit(Weatherfailure());
         }
    });
  }
}
