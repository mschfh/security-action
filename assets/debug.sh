#!/bin/bash -xe
pwd
tree -a
echo $RUNNER_TEMP
tree -a $RUNNER_TEMP
realpath "$0"
realpath -s "$0"
echo $ASSIGNEES
find . -name Gemfile.lock | xargs -0 -n1 dirname | grep -v Gemfile.lock | sort -u &&\
      xargs -IXXX ../.gem/bin/bundler exec brakeman --format json --no-exit-on-warn --no-exit-on-error XXX \
      | jq -r '.warnings[] | "\(.file):\(.line) \(.message)<br><br>source: \(.link)<br><br>"' \
      | sort -u | sed "s/$/Cc @brave\/sec-team $ASSIGNEES/g"