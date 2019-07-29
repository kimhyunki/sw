#!/bin/sh

USER='khk'
REPO=$PWD
COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`
DATELOG=`date +'%Y-%m-%d-%H-%M-%S'`
LOG="/tmp/${DATELOG}.txt"

MKDOCS=`which mkdocs`
GIT=`which git`
NOTIFY=`which notify-send`

# Only proceed if we have a valid repo.
if [ ! -d ${REPO}/.git ]; then
	echo "${REPO} is not a valid git repo! Aborting..." >> ${LOG}
	exit 0
else
	echo "${REPO} is a valid git repo! Proceeding..." >> ${LOG}
fi

${GIT} add --all . >> ${LOG}
${GIT} commit -m "Automated commit on ${COMMIT_TIMESTAMP}" >> ${LOG}
${GIT} push git@bitbucket.org:username/repo.git master >> ${LOG}

# Depends on libnotify
${NOTIFY} 'KB notification' 'Changes were pushed to Bitbucket.' --icon=dialog-information >> ${LOG}
