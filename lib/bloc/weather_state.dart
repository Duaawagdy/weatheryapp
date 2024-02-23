part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class Weathersucces extends WeatherState {
  final Weather weather;
   Weathersucces(this.weather);
  List<Object>get props =>[weather];

}
class Weatherfailure extends WeatherState {}
class Weatherloading extends WeatherState {}
