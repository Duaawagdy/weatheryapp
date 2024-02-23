import 'package:flutter/material.dart';

class custemdisplaywigdet extends StatelessWidget {
  const custemdisplaywigdet({
    super.key, required this.State, required this.assetsnum, required this.text,
  });
  final String State;
  final int assetsnum;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset('assets/${assetsnum}.png',scale: 8,),
      const SizedBox(width: 5),
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300
            ),
          ),
          const SizedBox(height: 3),
          Text(
            State
            ,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700
            ),
          ),
        ],)
    ],);
  }
}