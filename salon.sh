#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\nWelcome to My Salon, how can I help you?\n"
  echo -e "\n1) cut\n2) color \n3) perm \n4) style \n5) trim"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) CUT ;;
    2) COLOR ;;
    3) PERM ;;
    4) STYLE ;;
    5) TRIM ;;
    *) MAIN_MENU "I could not find that service. What would you like today?";;
  esac
}
CUT() {
  #get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #if not found
      if [[ -z $CUSTOMER_NAME ]]
      then
        #get customer info
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        #record customer info
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      fi
        #ask for time
        echo -e "\nWhat time would you like your$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME
        SET_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")
        #confirm appointment
        echo -e "\nI have put you down for a$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'") at$($PSQL "SELECT time FROM appointments WHERE time = '$SERVICE_TIME' ORDER BY appointment_id LIMIT 1"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}
COLOR() {
  #get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #if not found
      if [[ -z $CUSTOMER_NAME ]]
      then
        #get customer info
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        #record customer info
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      fi
        #ask for time
        echo -e "\nWhat time would you like your$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME
        SET_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")
        #confirm appointment
        echo -e "\nI have put you down for a$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'") at$($PSQL "SELECT time FROM appointments WHERE time = '$SERVICE_TIME' ORDER BY appointment_id LIMIT 1"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}
PERM() {
  #get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #if not found
      if [[ -z $CUSTOMER_NAME ]]
      then
        #get customer info
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        #record customer info
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      fi
        #ask for time
        echo -e "\nWhat time would you like your$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME
        SET_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")
        #confirm appointment
        echo -e "\nI have put you down for a$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'") at$($PSQL "SELECT time FROM appointments WHERE time = '$SERVICE_TIME' ORDER BY appointment_id LIMIT 1"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}
STYLE() {
  #get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #if not found
      if [[ -z $CUSTOMER_NAME ]]
      then
        #get customer info
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        #record customer info
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      fi
        #ask for time
        echo -e "\nWhat time would you like your$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME
        SET_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")
        #confirm appointment
        echo -e "\nI have put you down for a$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'") at$($PSQL "SELECT time FROM appointments WHERE time = '$SERVICE_TIME' ORDER BY appointment_id LIMIT 1"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}
TRIM() {
  #get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #if not found
      if [[ -z $CUSTOMER_NAME ]]
      then
        #get customer info
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        #record customer info
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      fi
        #ask for time
        echo -e "\nWhat time would you like your$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME
        SET_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")
        #confirm appointment
        echo -e "\nI have put you down for a$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'") at$($PSQL "SELECT time FROM appointments WHERE time = '$SERVICE_TIME' ORDER BY appointment_id LIMIT 1"), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}
MAIN_MENU