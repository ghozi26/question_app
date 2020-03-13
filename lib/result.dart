import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function backToHome;
  final String resultText;
  final String btnBackText;
  final int resultScore;

  Result({
    @required this.backToHome,
    @required this.resultText,
    @required this.btnBackText,
    this.resultScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                resultText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Center(
              child: Text(
                'Your Score is ' + resultScore.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Center(
              child: RaisedButton.icon(
                onPressed: backToHome,
                color: Colors.green,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                label: Text(
                  btnBackText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
