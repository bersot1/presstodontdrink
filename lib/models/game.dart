class GameModel {
  final int id, limit, total = 2;
  final String description, title, peopleRange, image;
  final List<Map> rules;
  GameModel({
    this.peopleRange,
    this.title,
    this.id,
    this.description,
    this.rules,
    this.image,
    this.limit,
  });
}

List<GameModel> gameslist = [
  GameModel(
    id: 1,
    image: "assets/images/tapdrink.jpg",
    title: "Quickly",
    peopleRange: "only 2 players",
    description: "You need to press the button more times than your opponent, "
        "if you lose you will drink. "
        "Try not to break your phone screen.",
    rules: [],
    limit: 2,
  ),
  GameModel(
    id: 2,
    image: "assets/images/15game.jpg",
    title: "15 Game",
    peopleRange: "only 2 players",
    description:
        "First, a count from 1 to 15 is established (each person saying a number aloud)"
        " just to determine who is going to create the rule for this move, in this case, "
        "who gets the number FIFTEEN. That person can exchange any number for anything he wants, "
        "for a word, a sound, or even for another number!",
    rules: [],
    limit: 2,
  ),
];
