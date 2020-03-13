import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function backToHome;
  final String resultText;
  final String btnBackText;
  final int resultScore;
  final List objResultAnswer;

  Result({
    @required this.backToHome,
    @required this.resultText,
    @required this.btnBackText,
    @required this.resultScore,
    @required this.objResultAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(children: [
                Column(children: [
                  Container(
                    alignment: Alignment(0.0, 0.0),
                    height: 35.0,
                    child: Text(
                      'Your Answer',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  )
                ]),
                Column(children: [
                  Container(
                    alignment: Alignment(0.0, 0.0),
                    height: 35.0,
                    child: Text(
                      'Score',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  )
                ]),
              ]),
              ...(objResultAnswer.map((data) {
                return TableRow(children: [
                  Column(children: [
                    Container(
                      alignment: Alignment(0.0, 0.0),
                      height: 35.0,
                      child: Text(
                        data['choice'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )
                  ]),
                  Column(children: [
                    Container(
                      alignment: Alignment(0.0, 0.0),
                      height: 35.0,
                      child: Text(
                        data['score'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )
                  ]),
                ]);
              }))
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 25),
              alignment: Alignment(0.0, 0.0),
              child: Text(
                resultText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment(0.0, 0.0),
              child: Text(
                'Your Score is ' + resultScore.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Center(
              child: Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment(0.0, 0.0),
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
          ))
        ],
      ),
    );
  }
}
