#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE teams,games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    #record winners
    if [[ $WINNER != winner ]]
    then
      WIN_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT DO NOTHING")
    fi
    #record opponents
    if [[ $OPPONENT != opponent ]]
    then
      OPP_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT DO NOTHING")
    fi
    #get winner id
    if [[ $WINNER != winner ]]
    then
      WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi
    #get opponent id
    if [[ $OPPONENT != opponent ]]
    then
      OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi
    #record games
    if [[ $YEAR != year ]]
    then
      RECORD_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND',$WIN_ID,$OPP_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    fi
  done