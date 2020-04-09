import 'package:flutter/material.dart';
import 'package:taptodontdrink/bloc/players-bloc.dart';
import 'package:provider/provider.dart';
import 'package:taptodontdrink/pages/game.page.dart';

class InitialPage extends StatelessWidget {
  var playerA = TextEditingController();
  var playerB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
            padding: EdgeInsets.only(
              left: 30,
              top: 60,
              right: 30,
            ),
            height: 400,
            width: 400,
            color: Colors.red,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: playerA,
                  decoration: InputDecoration(
                    labelText: "Player 1",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: playerB,
                  decoration: InputDecoration(
                    labelText: "Player 2",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  color: Colors.blue,
                  child: Text(
                    "Começar",
                  ),
                  onPressed: () {
                    bloc.setUpPlayers(playerA.text, playerB.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(),
                      ),
                    );
                  },
                )
              ],
            )),
      ),
    );
  }
}
