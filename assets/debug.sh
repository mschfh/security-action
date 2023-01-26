#!/bin/bash -xe
pwd
tree -a
echo $RUNNER_TEMP
tree -a $RUNNER_TEMP
realpath "$0"
realpath -s "$0"
echo $ASSIGNEES

echo Paths

find . -name Gemfile.lock | xargs dirname | grep -v Gemfile.lock | sort -u

echo json

../.gem/bin/bundler exec brakeman --format json --no-exit-on-warn --no-exit-on-error t3sts/brakeman

echo pathsandjson

find . -name Gemfile.lock | xargs dirname | grep -v Gemfile.lock | sort -u &&\
      xargs -IXXX ../.gem/bin/bundler exec brakeman --quiet --format json --no-exit-on-warn --no-exit-on-error XXX\
    
echo pathsandjsonandjq

find . -name Gemfile.lock | xargs dirname | grep -v Gemfile.lock | sort -u &&\
      xargs -IXXX ../.gem/bin/bundler exec brakeman --quiet --format json --no-exit-on-warn --no-exit-on-error XXX \
      | jq -r '.warnings[] | "\(.file):\(.line) \(.message)<br><br>source: \(.link)<br><br>"'