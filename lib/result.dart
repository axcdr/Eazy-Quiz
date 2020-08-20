import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase{
    String resultText;
    if(resultScore<=10){
      resultText='You are awesome!';
    } else if(resultScore<=15){
      resultText='Pretty Likeable!';
    } else if(resultScore<=20){
      resultText='You are...strange!!!';
    }else{
      resultText='Wow...you made it!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text(resultPhrase,style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          );
  }
}