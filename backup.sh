#!/bin/bash

# Remove training slash: http://stackoverflow.com/a/1848456
TARGET=${1%/}
DESTINATION=${2%/}
MAXIMUM_DAYS=$3
BASENAME=$(basename $TARGET)
TARGET_FILE_NAME=$BASENAME-$(date +%Y-%m-%d.%H.%M.%S).tar.gz
FULL_TARGET_PATH=$DESTINATION/$TARGET_FILE_NAME

# Detect OS types: OS X, Linux.
# See: http://stackoverflow.com/a/17072017
if [ "$(uname)" == "Darwin" ]; then
    REMOVE_BACKUPS=$(date -v-${MAXIMUM_DAYS}d +%F)
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    REMOVE_BACKUPS=$(date +%Y-%m-%d --date="-$MAXIMUM_DAYS day")
fi

tar -czvf $FULL_TARGET_PATH $TARGET

echo "Backed up $TARGET to $FULL_TARGET_PATH."

# Remove existing expired backups

EXPIRED_FILES=$DESTINATION/$BASENAME-$REMOVE_BACKUPS*

# Determine the existence of old backups: http://stackoverflow.com/a/6364244
if ls $EXPIRED_FILES 1> /dev/null 2>&1; then
    rm $EXPIRED_FILES
    echo "Removed expired backups: $EXPIRED_FILES."
fi

echo "Done!"
