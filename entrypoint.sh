#!/bin/sh

echo "Setting required workspace permissions"
chmod -R a+w /github/workspace

# Interrupt execution on error
set -e

echo "====================== Start build ======================="
echo "=========================================================="

echo -e "->\tUsing jekyll's build command"
IS_VERBOSE_ENABLED=$1
if [ $IS_VERBOSE_ENABLED = 'true' ]
then
  echo -e "->\tVerbose enabled"
   jekyll build --trace --verbose
else
  echo -e "->\tVerbose disabled"
   jekyll build --trace
fi

echo "=========================================================="
echo "===================== Build finished ====================="
