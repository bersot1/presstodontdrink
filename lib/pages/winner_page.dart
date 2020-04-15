import 'package:flutter/material.dart';
import 'package:taptodontdrink/bloc/players-bloc.dart';
import 'package:provider/provider.dart';
import 'package:taptodontdrink/pages/initial.page.dart';

class Winner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 90,
                  ),
                  child: Text(
                    "${bloc.whoWinner}",
                    style: TextStyle(
                      fontFamily: "Big Shoulders Display",
                      fontSize: 70,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "VOCÊ GANHOU",
                  style: TextStyle(
                    fontFamily: "Big Shoulders Display",
                    fontSize: 70,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: Colors.black26,
                  ),
                  child: FlatButton(
                    child: Text("Change Players"),
                    onPressed: () {
                      bloc.changeWarrios();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InitialPage(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: Colors.black26,
                  ),
                  child: FlatButton(
                    child: Text("Drink More"),
                    onPressed: () {
                      bloc.drinkMore();
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 25,
                  ),
                  child: Text(
                    "${bloc.whoLose}",
                    style: TextStyle(
                      fontFamily: "Big Shoulders Display",
                      fontSize: 70,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "DRINK",
                  style: TextStyle(
                    fontFamily: "Big Shoulders Display",
                    fontSize: 35,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
