import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taptodontdrink/bloc/players-bloc.dart';
import 'package:provider/provider.dart';
import 'package:taptodontdrink/pages/winner_page.dart';

class GamePage extends StatelessWidget {
  double countPlayerA = 0.05;
  double countPlayerB = 0.05;

  double resultLinearProgress = 0.5;

  tapButton(double tap) {
    this.resultLinearProgress += tap;
    print(this.resultLinearProgress);
  }

  @override
  Widget build(BuildContext context) {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);

    return bloc.winner
        ? Winner()
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              top: 15,
                            ),
                            height: 200,
                            width: 300,
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
                                      //bloc.playerA,
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
                                bloc.tapButton(0.15);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 100,
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
                            value: bloc.progressBar,
                            backgroundColor: Colors.red,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[Icon(Icons.local_drink)],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 65),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(30),
                            height: 200,
                            width: 300,
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
                              onPressed: () {
                                bloc.tapButton(-0.15);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
