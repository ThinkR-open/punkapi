
<!-- README.md is generated from README.Rmd. Please edit that file -->

# punkapi

<!-- badges: start -->

<!-- badges: end -->

## About

A collaboratively built package created during a [package development
training](https://thinkr.fr/formation-au-logiciel-r/creation-de-packages-r/).

The `{punkapi}` package will contain functions to call the Punk API.
Documentation is at: <https://punkapi.com/documentation/v2>

## How to

The list of tasks are at <https://github.com/ThinkR-open/punkapi/issues>

These issues contain a series of functions to implement and bugs to fix.

> Note: for this exercise, we will be working only with main & branches
> (no dev)

Step by step:

1.  Clone this repo to your computer
2.  Leave a comment on one issue to indicate you want to work on it
3.  Create a new branch, starting from `main`, named `issue-XXX`, where
    `XXX` is the issue you want to work on
4.  Once you’ve done the implementation, make sure your branch is
    up-to-date with `main`
5.  Make a PR to `main`
6.  Your branch should pass the GitHub Action check to be valid
7.  Tag @colinfay as a reviewer
8.  Work on another issue

## Reminder git

BEFORE making a commit to your branch:

    git pull
    git add .
    git stash
    git rebase origin/main
    git stash apply

  - Resolve conflicts
  - Commit
  - Push

## Requirements

1.  Every function should check the user inputs
2.  Every function should fail gracefully (i.e return an informative
    messages in case of failure)
3.  Every function should be fully documented
4.  Every dependency should be fully set
