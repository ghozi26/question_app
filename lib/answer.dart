import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: RaisedButton(
        color: Colors.blue,
        onPressed: selectHandler,
        child: Text(
          answerText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
