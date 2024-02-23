part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object>get props =>[];

  get position => null;
}
class feachweather extends WeatherEvent{
 final Position position;
  const feachweather(this.position);
  @override
  List<Object>get props =>[position];
}
