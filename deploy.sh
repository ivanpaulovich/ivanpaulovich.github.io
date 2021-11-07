#!/bin/bash

#git rm -r _site
#rm -rf .git/modules/_site
#git submodule add -b master git@github.com:ivanpaulovich/ivanpaulovich.github.io.git _site

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
#hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
bundle exec jekyll build

# Go To _site folder
cd _site
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..