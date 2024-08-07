#!/bin/bash

INTERVAL_SECONDS=3600 # Update every hour
TEMP_FILE="/tmp/pacman-script-$USER"
UPDATE_COUNT=0
CURRENT_TIME=$(date +%s)

read_file() {
  cached_time=$(sed -n '1p' $TEMP_FILE)
  if [ $((CURRENT_TIME-cached_time)) -gt $INTERVAL_SECONDS ]; then
    write_file
  else
    UPDATE_COUNT=$(sed -n '2p' $TEMP_FILE)
  fi
}

write_file() {
  UPDATE_COUNT=$(checkupdates | wc -l)
  echo -e "$CURRENT_TIME\n$UPDATE_COUNT" > $TEMP_FILE
}


if [ -f $TEMP_FILE ]; then
  read_file
else
  write_file
fi

if [ $UPDATE_COUNT -gt 0 ]; then
  echo "%{F#999}Pacman Updates: %{F#a00}$UPDATE_COUNT"
else
  echo ""
fi
