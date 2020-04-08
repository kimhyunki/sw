#!/bin/bash
START=$(date +%s)
# do something

# start your script work here
#ls -R /etc > /tmp/x
#rm -f /tmp/x
# your logic ends here

sleep 61

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"
