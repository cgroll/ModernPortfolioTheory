ModernPortfolioTheory
=====================

This is the common repository for the LMU course "Modern Portfolio Theory with Matlab"

# Install git

Set username and email. Both will be globally viewable on github. 
https://help.github.com/articles/set-up-git#platform-windows


# Create Github account

Go to www.github.com and create an account. Note that your email
address will be openly viewable!




## SSH Access

Github for Windows
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
