[![Build Status](https://travis-ci.org/YourGitHubId/PortlandStateJavaSummer2020.svg?branch=master)](https://travis-ci.org/YourGitHubId/PortlandStateJavaSummer2020)

# Getting Started with Advanced Programming with Java

This repository helps students in [Advanced Programming with
Java](http://web.cecs.pdx.edu/~whitlock/) get started with the
programming assignments.  Most noteably, it makes it so students do
not need install [Apache Maven](https://maven.apache.org/install.html)
on their local machines (or the PSU machines) in order to create and
build the programming projects.  It makes liberal use of the [Maven
Wrapper](https://github.com/takari/maven-wrapper) script which
automatically downloads and installs the version of Maven needed for
the programming projects.

Prior to following these instructions, you may want to review the
"Getting Started with Java"
[slides](http://web.cecs.pdx.edu/~whitlock/pdf/Getting%20started%20with%20Java.pdf)
and
[screencast](https://www.youtube.com/watch?v=VZXEwcgigaw&list=SPyM7S4CZk9WPrtC8AclCNxOBA8buEJdib)
from the [course's website](http://web.cecs.pdx.edu/~whitlock/).

## How do I use this repository?

In order to use this repository, you must [intall
git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) on
your local machine.  Next you need to make a clone of the repository.

If you simply make a `git clone` of this GitHub repository on your
local machine, you can commit changes to your local repository, but
you can't "push" your changes to the repository hosted on GitHub.
This is because I own this GitHub repository and you do not have
permission to push changes from your local repository into my
repository.  Even if I did give you permission to push to my
repository, we don't want the source code that you wrote for your
projects to be available publically for everyone to see.

However, it is very useful to leverage git (and GitHub) to
easily move that code between multiple machines.  It would enable you
to develop your code on your local machine and test it on the PSU CS
Department's machines before you submit it.  This is possible to do
with GitHub, but it requires some extra steps.  GitHub provides some
[really good
documentation](https://help.github.com/en/articles/duplicating-a-repository)
on how to this and I'll summarize it here.

First, create a [GitHub "student
developer"](https://education.github.com/pack) account that gives you
free private repositories.  Then [create a private GitHub
repository](https://help.github.com/en/articles/creating-a-new-repository)
for your source code for this course.  (In this example, the
repository is named "PortlandStateJavaSummer2020".)  Note that you do
**not** want to "Initialize this repository with a README".  You want
to create a completely empty repository so that you can initially
populate it from my (this) repository.

Now, here comes some of the magic.  Make a "bare" clone of my repository.  

```sh
$ git clone --bare https://github.com/DavidWhitlock/PortlandStateJavaGettingStarted.git
```

Note that the name of the directory created by the bare clone is
`PortlandStateJavaGettingStarted.git`; it is not the same as a regular
clone of the repository.  This "bare" clone is disconnected from the remote
repository hosted on GitHub, which is what we want because starting today your code
will be different from mine.

Then push the bare clone to your newly-created private repository.

```sh
$ cd PortlandStateJavaGettingStarted.git
$ git push --mirror https://github.com/YourGitHubUser/PortlandStateJavaSummer2020.git
```

If you view your repository on GitHub, you should see the changes
mirrored from my repository.

Now you can delete the bare clone and make a local clone your
repository to work with.

```sh
$ cd ..
$ rm -rf PortlandStateJavaGettingStarted.git
$ git clone https://github.com/YourGitHubUser/PortlandStateJavaSummer2020.git
```

### What do I need to do before I can use this repository?

The following command lines assume that you are running in the
directory created by cloning the repository.

```sh
$ cd PortlandStateJavaSummer2020
```

You'll need to install the [latest version of the Java Development
Kit](https://jdk.java.net/) in order to run the Maven Wrapper and work
with the projects.

You'll also need to copy the `settings.xml` file to the `.m2`
directory in your home directory.  This configuration enables Maven to
find the artifacts used for the course.

```sh
$ mkdir ~/.m2
$ cp settings.xml ~/.m2/
```

### How do I create and run my own Java projects?

The primary purpose of this repository is to make it easy to create
the skeleton Java projects that are used to start your assignment.
Scripts such as `createProject0.sh` will run the appropriate Maven
commands to get you started.  Each of these scripts takes a single
argument which is your MCECS user id.  This one-word user id (mine is
`whitlock`) is used to uniquely identify your code and is included in
the name of the Java package for the project.  (It is importand that 
you consistently use this user id in the course.  For instance, please
use your MCECS user id when you run the `Survey` and `Submit` programs.

```sh
$ ./createProject0.sh your-mcecs-user-id
```

(Note that in this document, I always prefix executables with `./` to
ensure that the executable can be found even if you don't have `.` on
your `PATH`.  Note also that for people who are developing on Windows
machines, there is a `createProject0.cmd` that does the same thing as
the shell script, but doesn't have as nice error checking.  Students
have not been able to get the shell script to work under cygwin.)

This script will generate a new Maven project in a directory named
`student` for [Project
0](http://web.cecs.pdx.edu/~whitlock/pdf/Student.pdf), the example
"Student" project.  You can then build this project using the Maven
Wrapper included in the project.

```sh
$ cd student
$ chmod +x mvnw        # Make the wrapper script executable
$ ./mvnw verify
```

Note that the first time that you run Maven, it will download a whole
ton of libraries.  You'll see lots of text fly by.

If the build completes successful, you can use your favorite editor (I
highly recommend [IntelliJ](https://www.jetbrains.com/idea/)) to work 
on the project.

### How can I commit my code to this repository?

After creating a Maven project, you can add the code it to your local
clone by adding the directory to git.

```sh
$ ./mvnw clean     # Remove files that shouldn't be commited to version control
$ cd ..    # to PortlandStateJavaSummer2020 directory
$ git add student
$ git commit -m "Added source files for student project"
```

By maintaining your project files in version control, you can easily
revert back to a known good version if something goes screwy.  You can
also use [git's branching
features](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)
to easily revisit (and revise) your source code for Project 1 even
though you've started working on Project 2.

### How do I work with code from this repository using IntelliJ?

[IntelliJ Idea](https://www.jetbrains.com/idea) is the recommended IDE
for this course.  Opening up the `pom.xml` as a Project in IntelliJ
will create a new IntelliJ workspace for that Maven project.  IntelliJ
has excellent integration with GitHub and I recommend that you use
IntelliJ's "Version Control" tools for committing changes to your code
and pushing them to GitHub.

Note that you must build the Maven project with `mvnw verify` **before
you open the project in IntelliJ**.  If you do not build the Maven
project first, none of the project's dependent libraries will be
available to IntelliJ and your IDE will be very unhappy.  If you find
yourself in this situation, close the IntelliJ project, and delete the
`.iml` file and the `.idea` directory associated with Maven project.

### How can I get a copy of this code on the CS Department's Linux machines?

While your projects can be developed on any machine, they must be
submitted on one of the CS Department's Linux machines.  This not only
encourages you to build and test your code on the machines on which I
will test your code, it is necessary because the `Submit` program
sends an email through a PSU-managed SMTP server.

GitHub makes it very easy to get a copy of your code on any machine.
By making a clone of your repository on the CS Department's machine,
you can be confident that you have all of your code and, as long as
you have pushed all of your changes to GitHub, it will be the same
code as you use on your development machine.

After `ssh`ing to one of the CS Department's Linux machines, you can
make a clone of your GitHub repository using with:

```
$ git clone https://github.com/YourGitHubId/PortlandStateJavaSummer2020.git
```

### How can I get changes that other people make into my clone?

You can expect that the scripts and information in this repository
will change and evolve over time.  You may want these changes in your
repository.  Here's what you need to do to incorporate changes made in
this "upstream" repository into your own repository.

First, configure your repository to have this repository to be a
"remote" named "upstream".

```sh
$ cd PortlandStateJavaSummer2020
$ git remote add upstream https://github.com/DavidWhitlock/PortlandStateJavaGettingStarted.git
```

Then, you can "pull" and "merge" changes from the upstream repository
in to your own local clone.

```sh
$ git pull upstream master
```

After you've resolved any conflicts caused by changes to your
repository and changes to the upstream repository.  You can push those
changes back to GitHub ("origin") with:

```sh
$ git push
```

## How do I use the "parent POM"?

This repository includes a "parent" [pom.xml](pom.xml) file.  You'll
need to edit the `pom.xml` file to include your user id and GitHub
user name.  As you create projects (such as Project 1), they will be
added as sub-modules to the parent POM.

Having a parent project (POM) for all of your projects is convenient
because it lets you build all of your code in one invocation of Maven.
While this is not strictly necessary, it does enable easy integration
with continuous integration tools such as Travis CI.  Travis CI is
free for public repositories, but they appear to have an [educational
program](https://education.travis-ci.com/) that is free to students
with a GitHub education account.

The parent project also allows you to create a multi-module [Maven
site](https://maven.apache.org/guides/mini/guide-site.html) for all of
your projects.

## How can I create a website for the projects in this repository?

Running `mvn site` from the root directory of this repository will
generate a website that provides lots of information (reports, etc.) 
about the Maven projects.  Note that in order for your multi-project
Maven site to generate correctly, the sub-projects must specify that
their parent project is the `PortlandStateJavaSummer2020` project in
your group:

```
  <parent>
    <artifactId>PortlandStateJavaSummer2020</artifactId>
    <groupId>edu.pdx.cs410J.whitlock</groupId>
    <version>Summer2020</version>
  </parent>
```

[GitHub Pages](https://guides.github.com/features/pages/) are web
pages that are hosted by GitHub and can easily be published via
GitHub.  You can post the website for your Maven projects by first
creating a `gh-pages` branch of your repository and pushing it to
GitHub:

```
$ git branch gh-pages
$ git checkout gh-pages
$ git push --set-upstream origin gh-pages
$ git checkout master
```

The you can generate and publish your website using the below
commands.  Note that before you can do this, you must replace
instances of `YouGitHubUser` with your GitHub user name in the
top-level (parent) `pom.xml` file.  (Note that it is essential that
your GitHub id be **lowercase letters** in the
`distributionManagement/url` section of the `pom.xml` file.)

```
$ ./mvnw site
$ ./mvnw site:stage      # Gathers site files across multiple projects
$ ./mvnw site:deploy     # Uploads to GitHub
```

You can open `target/staging/index.html` in your web browse to see
what your site will look like.

Verify that your website is available at a URL like:
https://yourgithubuser.github.io/PortlandStateJavaSummer2020

## How can I improve this repository?

This repository is kind of thrown together and it ought to evolve to
meet the needs of the students who take Advanced Programming with
Java.  

Feel free to [create issues](../../issues) for this repository if you find
something missing or confusing.

It's even better, though, when someone contribute their own changes
(add new scripts, augment documentation, fix type-os, etc.), to this
repository.  Please make a (public)
[fork](https://help.github.com/en/articles/fork-a-repo) of this
repository in GitHub, make your changes in a branch of that
repository, and [create a pull
request](https://help.github.com/en/articles/creating-a-pull-request-from-a-fork)
against this repository.  We can then have a discussion about your
changes via GitHub.
