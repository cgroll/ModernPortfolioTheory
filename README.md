ModernPortfolioTheory
=====================

This is the common repository for the LMU course "Modern Portfolio
Theory with Matlab". The README file lists some instructions and tips
in order to participate in the development process. If you are
interested in tips on the usage of the package, neither documentation
nor tutorial are generated yet.  

# Installation on windows

## Create account on Github

Go to www.github.com and create an account. Note that you eventually will have to submit a publicly visible email address. At best, you already use this email address from start on.

## Set up Github

- Follow link to the "set up git" webpage:
  https://help.github.com/articles/set-up-git#platform-windows
- at individual installation steps, choose the following options:
  - advanced context menu
  - use git bash only
  - checkout windows style, commit unix-style
- press "Download Github for Windows": this will also install git together with a git shell
- install "Github for Windows": set username and email correctly, in
  order to make your contributions to the project be counted (for
  issues for when your commits are not correctly contributed to you,
  see:
  https://help.github.com/articles/why-are-my-contributions-not-showing-up-on-my-profile#which-contributions-are-counted). Note: Contributions to forks are only counted when they land in the upstream's default branch. 


## SSH Access

In order to enable synchronizations without password queries, you
usually have to enable ssh identification first. However, this should
be automatically set up for you through the Github for Windows app.
You will simply receive a notification that a ssh key of your computer
was added to your github account. See:
https://help.github.com/articles/do-i-need-ssh-keys-to-use-github-for-windows

As long as you do not change the computer in the CIP-Pool, you should not
need to bother about any password queries.

## SSH Access on different computers

If you need to manually set up ssh access, you can follow the
instructions of the github help pages:
https://help.github.com/articles/generating-ssh-keys#platform-windows

## Clone repository

On your computer, change to the directory that you want the repository to reside in. In this directory, the following command will create a folder ModernPortfolioTheory:

```` sh
git clone git@github.com:cgroll/ModernPortfolioTheory.git
````

# Using Git

## Advantages
- collaboration: simultaneously working on the same file (cheaply resolving
  conflicts) 
- roll back project to previous state
- branching: sandbox environment for experimenting (never break
  already working code) 
- split off code development: other people can still rely on stable code
  base 
- github as communication plattform

## Git concept
Every single file and change that was ever done to the repository will
be kept forever. (For efficient storage, files are stored as "data blobs")

There are three states that your files can reside in:
- committed (files are save in database)
- modified (new changes are not added to database yet)
- staged (new changes are not added yet, but file is marked to be added with next commit) 

Additional stage step allows to commit only subset of modified files.

## Git introduction

For a nice introduction to the basic usage of git, take a look at the
atlassian tutorials:
- https://www.atlassian.com/git/tutorial/git-basics
- https://www.atlassian.com/de/git/tutorial/git-basics (german version)

For a tutorial on branching and merging, check out:
- https://www.atlassian.com/git/tutorial/git-branches
- https://www.atlassian.com/de/git/tutorial/git-branches

## Main commands
````sh
git add foo.txt
git add bar.txt
git commit -m "added files foo and bar"
````

## Resolving conflicts

- git merge 
- manually fix conflicts
- git add file again
- git commit

http://githowto.com/resolving_conflicts
https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line

## Git resources

- official documentation: http://git-scm.com/documentation
- git related posts on blog:
  http://grollchristian.wordpress.com/tag/git/ 

## Git Gui

## Binary files and large data files

Remember: every data that you ever add to your repository will reside in the database for ever! (At least, if you do not mess with the git database on a very fundamental level) Hence, be careful not to commit large datafiles that change on a regular basis.
(For a more extensive description of the problem of large data files see http://grollchristian.wordpress.com/2013/10/01/git-for-data-analysis-1 )

# Development workflow: gitflow workflow

## Gitflow workflow

- NEVER rewrite history that already was published to github 
- NEVER directly commit to master branch
- create feature branch for new development
- file pull request into develop branch 

## Branching

Outsource development of new features into individual branches: main code base
should never contain defective code.

Start new branch based on current development:

````sh
git checkout -b create-markowitz-model develop
git add someFile.m
git commit -m "first file added"
git push -u origin create-markowitz-model
````

## Keep up to date

Get code extensions of collaborators:

````sh
git checkout develop
git pull origin develop
git checkout create-markowitz-model
git merge develop
````

## Merge feature branch into code base

- push latest commits to github

````sh
git push -u origin create-markowitz-model
````
- file pull request in github (from feature branch to develop branch)
- add relevant people to discussion of new code
- note: further commits to feature branch will automatically be added to pull request

## Create new feature
If new feature shall be developed based on last feature, while pull request of 
last feature is not yet merged:
- create new feature branch based on last feature


# Using Github

## Writing on Github

In order to write on github, you can make use of github flavored markdown (GFV), which easily let's you convert text into formatted html output. github markdown is a slight modification of general markdown, which aims to take some specific requirements of code development into account. Some resources on this topic are:
- https://help.github.com/articles/markdown-basics
- https://help.github.com/articles/github-flavored-markdown (differences from traditional markdown)
- https://help.github.com/articles/writing-on-github


For example, you can easily show syntax highlighted Matlab code blocks:
````matlab
function value = getSquare(x)
nObs = numel(x);
for ii=1:nObs
  value[ii] = x[ii]^2
end
````

For Windows, a possible offline markdown viewer could be MarkdownPad.
Also, here you can find a list of possible other viewers:
http://mashable.com/2013/06/24/markdown-tools/

Also, it is easy to reference commits, people or pull requests and the like.

# Matlab requirements

## style guidelines

functionName
variableName

instead of x, a, b, xx use isAllowed, nObservations, simulatedValues

don't use pluralization: date and dates are hard to distinguish! Use dateArray, dateVector, ...

Logical operators like “=”, “&” and “|” should always be surrounded by white spaces.

## function documentation

## unit testing

## data format 
tables

## cooperation requirements
- try not to break APIs
- avoid function renaming

# Project goals

## Modularity

## Project documentation / tutorial




