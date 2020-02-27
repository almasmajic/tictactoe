import 'package:flutter/material.dart';

class GameButton{
  final id;
  String text;
  Color bg; //boja pozadine
  bool enabled;

  GameButton(
  {this.id, this.text="",this.bg=Colors.grey,this.enabled=true});

}
