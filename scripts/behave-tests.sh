#!/bin/bash
#Behave test runner and conditional statements
if [ $CIRCLE_BRANCH = "master" ] || [ $CIRCLE_BRANCH = "develop" ]; then
	echo "running all behave tests" 
	behave --junit --junit-directory $CIRCLE_TEST_REPORTS --format pretty
	#if build is from master or dev branches then run ALL tests
else 
	echo "running faster tests because not building from master or develop"
	behave --tags=@fast --junit --junit-directory $CIRCLE_TEST_REPORTS --format pretty
	#if build is not from master or dev (like feature or hotfix) then only run fast behave tests
fi
	
