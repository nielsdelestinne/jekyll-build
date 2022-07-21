#!/bin/sh

echo "Setting Jekyll version to $1"
export JEKYLL_VERSION=$1

# Interrupt execution on error
set -e

echo "Setting required workspace permissions"
chmod -R a+w /github/workspace

echo "Starting to build"
echo -e "->\tUsing jekyll's build command"
IS_VERBOSE_ENABLED=$2
if [ $IS_VERBOSE_ENABLED = 'true' ]
then
  echo -e "->\tVerbose enabled"
   jekyll build --trace --verbose
else
  echo -e "->\tVerbose disabled"
   jekyll build --trace
fi

echo "Finished building"
