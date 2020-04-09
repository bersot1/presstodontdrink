import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taptodontdrink/bloc/players-bloc.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  double countPlayerA = 0.05;
  double countPlayerB = 0.05;

  double resultLinearProgress = 0.5;

  @override
  Widget build(BuildContext context) {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);

    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(30),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: FlatButton(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              top: 50,
                            ),
                            child: Text(
                              bloc.playerA,
                              style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: "Big Shoulders Display"),
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                      onPressed: () {
                        resultLinearProgress += countPlayerA;
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 150,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.local_drink,
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: resultLinearProgress,
                    backgroundColor: Colors.orange,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[Icon(Icons.local_drink)],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(30),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: FlatButton(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              top: 50,
                            ),
                            child: Icon(Icons.arrow_back),
                          ),
                          Text(
                            bloc.playerB,
                            style: TextStyle(
                                fontSize: 50,
                                fontFamily: "Big Shoulders Display"),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
