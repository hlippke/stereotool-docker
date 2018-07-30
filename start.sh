#!/bin/bash

${JACKPORT:=3000}

# Start JACK
jackd -d net -L $JACKPORT &

status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start JACK: $status"
  exit $status
fi

sleep 1

# Start stereotool
./stereo_tool_gui_jack_64 &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start StereoTool: $status"
  exit $status
fi

# Check once a minute to see if either of the processes exited.
# The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 60 seconds

while sleep 60; do
  ps aux |grep jackd |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep stereo_tool_gui_jack_64 |grep -q -v grep
  PROCESS_2_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done


