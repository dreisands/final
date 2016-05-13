# final
MPCS 52553 Final Project

This is an emulation of the Board Game Geek website, albeit with a substantially smaller backing database. I include models for games, their expansions, game record sessions, and collections.

The models are:

- User: Includes a username, email, and password
- Game: Contains information about the game's title, a link to a cover, the number of players, and other useful data
- Expansion: Board games sometimes come out with expansions, so having a seperate resource that cascades from Game will be useful
- Session: Contains information of who played in a specific game and the scores that resulted as well as who won. Probably could be finessed into a better form.
- Collection: Matches whether a user owns a given game and if so what rating they would give it