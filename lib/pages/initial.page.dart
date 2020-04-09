import 'package:flutter/material.dart';
import 'package:taptodontdrink/bloc/players-bloc.dart';
import 'package:provider/provider.dart';
import 'package:taptodontdrink/pages/game.page.dart';

class InitialPage extends StatelessWidget {
  var playerA = TextEditingController();
  var playerB = TextEditingController();

  String _jogadorA;
  String _jogadorB;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final PlayersGameBloc bloc = Provider.of<PlayersGameBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 50,
                    bottom: 40,
                  ),
                  child: Text(
                    "tap do not drink",
                    style: TextStyle(
                      fontFamily: "Big Shoulders Display",
                      fontSize: 60,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: 30,
                top: 25,
                right: 30,
              ),
              height: 400,
              width: 380,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      //controller: playerA,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Informe o nome do player 1";
                        }

                        return null;
                      },
                      onSaved: (input) => _jogadorA = input,
                      decoration: InputDecoration(
                        labelText: "Player 1",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                          fontFamily: "Big Shoulders Display",
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).primaryColor,
                          fontFamily: "Big Shoulders Display"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      // controller: playerB,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe o nome do player 2 ';
                        }
                        return null;
                      },
                      onSaved: (input) => _jogadorB = input,
                      decoration: InputDecoration(
                        labelText: "Player 2",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                          fontFamily: "Big Shoulders Display",
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Big Shoulders Display",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: FlatButton(
                        child: Text(
                          "Começar",
                          style: TextStyle(
                            fontFamily: "Big Shoulders Display",
                            fontSize: 35,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            bloc.setUpPlayers(_jogadorA, _jogadorB);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GamePage(),
                              ),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 80,
                  ),
                  child: Text(
                    "bersô.io",
                    style: TextStyle(
                      fontFamily: "Big Shoulders Display",
                      fontSize: 25,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
