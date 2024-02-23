import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatheryapp/bloc/weather_bloc.dart';
import 'package:weatheryapp/screens/home_page.dart';
import 'package:weatheryapp/screens/widgets/risesettempdisplay.dart';

class homepage extends StatefulWidget{
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Widget getWeatherIcon(int code) {

    switch (code) {
      case >= 200 && < 300 :
        return Image.asset(
            'assets/1.png'
        );
      case >= 300 && < 400 :
        return Image.asset(
            'assets/2.png'
        );
      case >= 500 && < 600 :
        return Image.asset(
            'assets/3.png'
        );
      case >= 600 && < 700 :
        return Image.asset(
            'assets/4.png'
        );
      case >= 700 && < 800 :
        return Image.asset(
            'assets/5.png'
        );
      case == 800 :
        return Image.asset(
            'assets/6.png'
        );
      case > 800 && <= 804 :
        return Image.asset(
            'assets/7.png'
        );
      default:
        return Image.asset(
            'assets/7.png'
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(padding: EdgeInsets.fromLTRB(40, 1.2*kToolbarHeight, 40, 20),
        child:SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Align(
              alignment: AlignmentDirectional(3,-0.3),
              child: Container(
                height: 300,
                width: 300,
              decoration:
              BoxDecoration(color: Colors.deepPurple,
                  shape: BoxShape.circle),),
            ),
            Align(
              alignment: AlignmentDirectional(-3,-0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration:
                BoxDecoration(color: Colors.deepPurple,
                    shape: BoxShape.circle),),
            ),
            Align(
              alignment: AlignmentDirectional(0,-1.2),
              child: Container(
                height: 300,
                width: 600,
                decoration:
                const BoxDecoration(
                  color: Color(0xffffab40),
                    ),),
            ),
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 100,sigmaY: 100),child:
            Container(decoration: BoxDecoration(color: Colors.transparent),),),
            BlocBuilder<WeatherBloc, WeatherState>(
             builder: (context, state) {
               if(state is Weathersucces){
              return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children:
              [Text('📍 ${state.weather.areaName}',style:
              const TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                  ),const SizedBox(height: 8,)
                ,const Text('Good Morning',style:
                TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                ),const SizedBox(height: 8,),
                getWeatherIcon(state.weather.weatherConditionCode!),
                Center(
                  child: Text(
                    '${state.weather.temperature!.celsius!.round()}°C',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${state.weather.weatherDescription!.toUpperCase()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),

          const SizedBox(height: 5),
      Center(
        child: Text(
          DateFormat('EEEE dd .').add_jm().format(state.weather.date!),
          style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300
          ),
        ),
      ),
      const SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    custemdisplaywigdet(State:DateFormat('').add_jm().format(state.weather.sunset!), assetsnum: 11, text: 'Sunrise',),
                    custemdisplaywigdet(State:  DateFormat('').add_jm().format(state.weather.sunset!), assetsnum: 12, text: 'Sunset')

                  ],)
                ,const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    custemdisplaywigdet(State:  '${state.weather.tempMax!.celsius!.round()}°C', assetsnum: 13, text: 'TempMax'),
                    custemdisplaywigdet(State:  '${state.weather.tempMin!.celsius!.round()}°C', assetsnum: 14, text: 'TempMin')
                  ],)
              ],
              ),
            );
               }else
                 {return Container();}
  },
),

          ],
          ),
        ) ,
      ),
    );
  }
}

