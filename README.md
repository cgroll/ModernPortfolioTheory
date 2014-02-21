ModernPortfolioTheory
=====================

This is the common repository for the LMU course "Modern Portfolio Theory with Matlab"

# Installation

## Create account on Github

Go to www.github.com and create an account. Note that you eventually will have to submit a publicly visible email address. At best, you already use this email address from start on.

## Set up Github

- Follow link to the "set up git" webpage: https://github.com/cgroll/ModernPortfolioTheory.git
- press "Download Github for Windows": this will also install git together with a git shell
- install "Github for Windows": set username and email, so that your commits can be tracked back to you (for issues for when your commits are not correctly contributed to you, see: https://help.github.com/articles/why-are-my-contributions-not-showing-up-on-my-profile#which-contributions-are-counted)

## Fork Main Repository

Go to the main project repository on https://github.com/cgroll/ModernPortfolioTheory and press "Fork". You now have the complete project data in your own account.

## Clone repository

In order to get the project data to your local computer, go to the project repository in *your own account*, and press "clone".

## Set upstream

You need to be connected to two different repositories:
- your *own* version of the project, which you already did clone. Here, you will push all your changes to.
- the *original* version of the project. Here, you will pull the project changes from, which were made by your collaborators.

Therefore, we still need to set the link to the original project. We will refer to it as "upstream".
````sh
git remote add upstream https://github.com/cgroll/ModernPortfolioTheory.git
````

## SSH Access

In order to enable synchronizations without password requests, you originally had to enable ssh identification. However, you should not be required to do this anymore. See https://help.github.com/articles/do-i-need-ssh-keys-to-use-github-for-windows

Otherwise, you can follow the instructions here:
https://help.github.com/articles/generating-ssh-keys#platform-windows



# Git Resources

# Writing on Github

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
