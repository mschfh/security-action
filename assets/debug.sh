#!/bin/bash -xe
pwd
tree -a
echo $RUNNER_TEMP
tree -a $RUNNER_TEMP
realpath "$0"
realpath -s "$0"
echo $ASSIGNEES
find . -name Gemfile.lock | xargs -0 -n1 dirname | sort -u &&\
      xargs -I{} ../.gem/bin/bundler exec brakeman --quiet --format tabs --no-exit-on-warn --no-exit-on-error {}