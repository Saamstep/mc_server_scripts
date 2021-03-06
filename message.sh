#!/bin/sh
# ./message.sh

## Temp/Dev Variables
 ENDPOINT=
 PORT=
 RCON_DIR=
 RCON_PASS=
 URL=
 #SERVERID=

## Init/Functions
echo "Panel Control by Samstep."

echo "Running $0"

##RCON as function
rcon() {
  cd $RCON_DIR
  ./rcon-cli --host $ENDPOINT --port $PORT --password $RCON_PASS "$*"
    echo "Ran command $*"
}

discord() {
  curl -X POST -d "{\"username\": \"Server\", \"avatar_url\": \"https://image.flaticon.com/icons/png/512/226/226777.png\", \"content\": \"$*\"}" ${URL}
  echo "Curl sucessful"
}

broadcast() {
  curl -X POST -d "{\"username\": \"Server\", \"avatar_url\": \"https://image.flaticon.com/icons/png/512/226/226777.png\", \"content\": \"$*\"}" ${URL}
  echo "Curl sucessful"
  cd $RCON_DIR
  ./rcon-cli --host $ENDPOINT --port $PORT --password $RCON_PASS "tellraw @a [\"[Broadcast] t$*\"]"
    echo "Broadcasted -> $*"
}

broadcast "Example broadcast to the server and Discord!"

#End script
exit



