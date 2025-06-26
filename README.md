[![Java CI with Maven](https://github.com/YourGitHubId/JoyOfCodingSummer2025/actions/workflows/maven.yml/badge.svg)](https://github.com/YourGitHubId/JoyOfCodingSummer2025/actions/workflows/maven.yml)

# Getting Started with The Joy of Coding with Java and Android

This repository helps students in [The Joy of Coding](http://web.cecs.pdx.edu/~whitlock/) get started with the
programming assignments.  Most notably, it gives students experience working with Git repositories and removed
the need to install [Apache Maven](https://maven.apache.org/install.html)
on their local machines (or the PSU machines) in order to create and
build the programming projects.  It makes liberal use of the [Maven
Wrapper](https://github.com/takari/maven-wrapper) script which
automatically downloads and installs the version of Maven needed for
the programming projects.  **You do not need to install Maven on your
local development machine.**

Prior to following these instructions, you may want to review the
"Getting Started with Java"
[slides](http://web.cecs.pdx.edu/~whitlock/pdf/Getting%20started%20with%20Java.pdf)
and
[screencast](https://www.youtube.com/watch?v=VZXEwcgigaw&list=SPyM7S4CZk9WPrtC8AclCNxOBA8buEJdib)
from the [course's website](http://web.cecs.pdx.edu/~whitlock/).

# Contents
1. [How do I use this repository?](#how-do-i-use-this-repository)
    1. [What do I need to do before I can use this repository?](#what-do-i-need-to-do-before-i-can-use-this-repository)
    2. [How do I use the Java Development Kit?](#how-do-i-use-the-java-development-kit)
        1. [How do I configure the JDK on the PSU Linux machines?](#how-do-i-configure-the-jdk-on-the-psu-linux-machines)
        2. [How do I install the JDK on my personal machine?](#how-do-i-install-the-jdk-on-my-personal-machine)
    3. [How do I configure information about myself?](#how-do-i-configure-information-about-myself)
    4. [How do I create and run my own Java projects?](#how-do-i-create-and-run-my-own-java-projects)
    5. [How can I commit my code to this repository?](#how-can-i-commit-my-code-to-this-repository)
    6. [How do I work with code from this repository using IntelliJ?](#how-do-i-work-with-code-from-this-repository-using-intellij)
    7. [How can I get a copy of this code on the CS Department's Linux machines?](#how-can-i-get-a-copy-of-this-code-on-the-cs-departments-linux-machines)
    8. [How can I get changes that other people make into my clone?](#how-can-i-get-changes-that-other-people-make-into-my-clone)
2. [How do I submit my projects?](#how-do-i-submit-my-projects)
    1. [About how long do the projects take to complete?](#about-how-long-do-the-projects-take-to-complete)
3. [How do I use the "parent POM"?](#how-do-i-use-the-parent-pom)
    1. [What's the deal with warnings about an incorrect parent POM?](#whats-the-deal-with-warnings-about-an-incorrect-parent-pom)
4. [How can I use a debugger to uncover the source of problems with my projects?](#how-can-i-use-a-debugger-to-uncover-the-source-of-problems-with-my-projects)
5. [How can I create a website for the projects in this repository?](#how-can-i-create-a-website-for-the-projects-in-this-repository)
6. [How can I improve this repository?](#how-can-i-improve-this-repository)

## How do I use this repository?

In order to use this repository, you must have a Git environment available on your development machine.
I recommend [installing
git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) on
your development machine to gain experience with the `git` command line tools (or the [GitHub 
Desktop](https://desktop.github.com/) tools).  If you are not able to get Git working on your development
machine, [IntelliJ has really great support for Git](https://www.jetbrains.com/help/idea/using-git-integration.html)
and makes it easy to perform fundamental clone/commit/push/pull Git operations.

After you have configured Git on your development machine, you need to create a repository of your own in which
you can do your work.
If you simply make a `git clone` of this GitHub repository on your
local machine, you can commit changes to your local repository, but
you can't "push" your changes to the repository hosted on GitHub.
This is because I own this GitHub repository, and you do not have
permission to push changes from your local repository into my
repository.  Even if I did give you permission to push to my
repository, we don't want the source code that you wrote for your
projects to be available publicly for everyone to see.

However, it is very useful to leverage git (and GitHub) to
easily move that code between multiple machines.  It enables you
to develop your code on your local machine and test it on the PSU CS
Department's machines before you submit it.  This is possible to do
with GitHub, but it requires some extra steps.

First, create a [GitHub "student
developer"](https://education.github.com/pack) account that gives you
free private repositories.  Then [create a private GitHub
repository from this "template" repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
for your source code for this course.  (In this example, the
repository is named "JoyOfCodingSummer2025".)

Again, please ensure that all of your code for the assignments is in a 
**private** GitHub repository.  GitHub makes it very easy for people to
find your code, and you do **not** want to have your work plagiarized.  After
the course is over, if you want to make your repository public to
help contribute to your coding portfolio, that's fine.  I do ask that 
current students not leverage former students' code to inform their 
projects.  If you have questions about your code that you'd like me to
answer, please feel free to [make me a collaborator](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/managing-access-to-your-personal-repositories/inviting-collaborators-to-a-personal-repository)
on your private repository.  I will try my best to engage you in a 
discussion about your code.

The below `git` command line examples are expressed using UNIX syntax.  They
are known to work on the CS Department's Linux machines and on macOS.  Students
who run on Windows may need to use "Git CMD" instead of "Git Bash" to get 
authentication with GitHub to work with HTTPS.  (Note that GitHub will no longer authenticate HTTPS with 
username/password credentials.  Authenticating with [ssh keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
or with [personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
is recommended.)


### What do I need to do before I can use this repository?

The following command lines assume that you are running in the
directory created by cloning the repository.

```sh
$ cd JoyOfCodingSummer2025
```

### How do I use the Java Development Kit?

The Java Development Kit (JDK) provides tools for compiling, packaging, and
running Java applications.  

This course requires at least Java 17.  You can determine which version of Java is configured in your environment
by issuing the `java -version` command:

```sh
$ java -version
openjdk version "21.0.5" 2024-10-15
OpenJDK Runtime Environment (build 21.0.5+11-Ubuntu-1ubuntu124.04)
OpenJDK 64-Bit Server VM (build 21.0.5+11-Ubuntu-1ubuntu124.04, mixed mode, sharing)
```

#### How do I configure the JDK on the PSU Linux machines?

Regardless of where your code is developed, it will be tested on the [MCECS Linux machines](https://cat.pdx.edu/platforms/linux/) 
(the machines in the `linux.cecs.pdx.edu` cluster).  Furthermore, projects can only be submitted
from the PSU Linux machines, so you'll need to make sure that your environment on these machines
is configured to run the right version of Java.

The PSU Linux machines are regularly patched and have a fairly recent version of Java installed.  Log into the PSU Linux
cluster and run the `java -version` as mentioned above to determine which version of Java will be used. 

#### How do I install the JDK on my personal machine?

For most of the projects in this course, it is possible (although, not optimal) to develop your code using the
tools on the MCECS Linux machines.  However, it is highly recommended using your personal desktop or laptop to
leverage tools like IntelliJ to author your projects. 

You'll need to install the [latest version of the Java Development
Kit](https://adoptium.net) in order to run the Maven Wrapper and work
with the projects.  (The "HotSpot" JVM should be fine for this course.)  
Windows users should download the "msi" (Microsoft Installer)
binary for an easy installation and configuration process.  During the 
installation process, select "set the JAVA_HOME" environment variable in order
for Maven to work correctly on the command line.

### How do I configure information about myself?

An important initial step in this course it to run the `survey.sh` script.  This script executes a Java program that
asks you some questions about yourself (such as your name, email address, and MCECS login id) and saves that
information to a `me.xml` in the directory in which the script is run.  (It also emails the XML file to the Grader
so that the Grader knows who you are, can contact you, and can record your grades.)  The information in this XML file
is used by other scripts in this repository to create the initial files for your projects and for submitting your
projects to the Grader.

Note that the `survey.sh` script **must be executed on one of the PSU MCECS Linux machines**.  It cannot be run on your
laptop or local development machine.

From the top-level directory of your local repository, run the `survey.sh` script.  It will ask you to enter some information about
yourself.  This information is used to submit your projects and record your grades.

```sh
$ ./survey.sh
```

After filling out the survey, commit the `me.xml` file to your git repository, so it can be used by the `submit.sh` script.

```sh
$ git add me.xml
$ git commit -m "Added information about myself from the survey program"
$ git push
```

Sending the Grader information about yourself by running the `survey.sh` script counts as your
["Initiation of Attendance"](https://www.pdx.edu/registration/faculty-guide-initiation-attendance) for the course.

### How do I create and run my own Java projects?

The primary purpose of this repository is to make it easy to create
the skeleton Java projects that are used to start your assignment.
Scripts such as `createStudentProject.sh` will run the appropriate Maven
commands to get you started.

```sh
$ ./createStudentProject.sh
```

(Note that in this document, I always prefix executables with `./` to
ensure that the executable can be found even if you don't have `.` on
your `PATH`.  The survey and project creation scripts must be run on a UNIX machine such as the MCECS Linux machines.  However,
the projects may be _developed_ on any machine that runs the supported version of Java.  For instance, it
is okay to create the project on Linux and then develop it on Windows,
using GitHub to share code across machines.)

This script will generate a new Maven project in a directory named
`student` for [Project
0](http://web.cecs.pdx.edu/~whitlock/pdf/Student.pdf), the example
"Student" project.  You can then build this project using the Maven
Wrapper (`mvnw` script) included in the project.  (Students running on 
Windows should invoke the `mvnw.cmd` script to build the Maven project.
The UNIX `mvnw` script has been problematic on Windows, even in Git Bash.)

```sh
$ cd student
$ ./mvnw verify
```

Note that the first time that you run Maven, it will download a whole
ton of libraries.  You'll see lots of text fly by.

If the build completes successful, you can use your favorite editor (I
highly recommend [IntelliJ](https://www.jetbrains.com/idea/)) to work 
on the project.

#### mvnw doesn't work with Git Bash on Windows

The Git Bash tool provides a UNIX command line environment on Windows that has support for `git`.  However, attempting
to run the UNIX `mvnw` script under Git Bash will likely result in this cryptic error:

```shell
curl: (3) URL using bad/illegal format or missing URL
Error: Could not find or load main class org.apache.maven.wrapper.MavenWrapperMain
Caused by: java.lang.ClassNotFoundException: org.apache.maven.wrapper.MavenWrapperMain
```

If you encounter this error, run `mvnw.cmd` on Git Bash instead of `mvnw`.

### How can I commit my code to this repository?

After creating a Maven project, you can add the code it to your local
clone by adding the directory to git.

```sh
$ ./mvnw clean     # Remove files that shouldn't be committed to version control
$ cd ..            # to JoyOfCodingSummer2025 directory
$ git add student
$ git commit -m "Added source files for student project"
```

By maintaining your project files in version control, you can easily
revert to a known good version if something goes screwy.  You can
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
yourself in this situation, close the IntelliJ project, and delete all
`.iml` files and the `.idea` directory associated with Maven project.

Note also that the first time you open up IntelliJ, you must [configure the Java Development Kit
(JDK)](https://www.jetbrains.com/help/idea/sdk.html#jdk).  Otherwise, IntelliJ will complain that it cannot find classes
like `java.lang.String`.  There will be a lot of red in the IDE.

Some students have used [IntelliJ to run Maven commands](https://www.jetbrains.com/help/idea/work-with-maven-goals.html)
which alleviated the need for them to install a JDK and Git in their local development environment. 

IntelliJ alerts the developer to code that requires attention, but not everything labelled as an "error" actually causes
problems.  In general, if you are able to run unit tests in IntelliJ and successfully build `mvnw clean verify`, your
code is likely in good shape.  There are a couple of "errors" that IntelliJ identifies that are safe to ignore:
   * `Plugin ‘org.apache.maven.plugins:maven-surefire-report-plugin:3.0.0-M7’ not found` can be remediated by running `mvnw verify` and `mvnw site`
   * `Cannot resolve symbol ‘grader’` in a `pom.xml` file can be safely ignored

### How can I get a copy of this code on the CS Department's Linux machines?

While your projects can be developed on any machine, they must be
submitted on one of the CS Department's Linux machines.  This not only
encourages you to build and test your code on the machines on which I
will test your code, it is necessary because the `submit.sh` script
sends an email through a PSU-managed SMTP server.

GitHub makes it very easy to get a copy of your code on any machine.
By making a clone of your repository on the CS Department's machine,
you can be confident that you have all of your code and, as long as
you have pushed all of your changes to GitHub, it will be the same
code as you use on your development machine.

After `ssh`ing to one of the CS Department's Linux machines, you can
make a clone of your GitHub repository using with:

```
$ git clone https://github.com/YourGitHubId/JoyOfCodingSummer2025.git
```

### How can I get changes that other people make into my clone?

You can expect that the scripts and information in this repository
will change and evolve over time.  You may want these changes in your
repository.  Here's what you need to do to incorporate changes made in
this "upstream" repository into your own repository.

First, configure your repository to have this repository to be a
"remote" named "upstream".

```sh
$ cd JoyOfCodingSummer2025
$ git remote add upstream https://github.com/JoyOfCodingPDX/GettingStarted.git
```

Then, you can "pull" and "merge" changes from the upstream repository
in to your own local clone.

```sh
$ git pull upstream main
```

After you've resolved any conflicts caused by changes to your
repository and changes to the upstream repository.  You can push those
changes back to GitHub ("origin") with:

```sh
$ git push
```

## How do I submit my projects?

The reason that this course can scale to support so many students is that many of the time-consuming "overhead"
activities have been automated.  For instance, extracting project submissions, running projects through the grading
scripts, and recording grades are automated.  This automation frees up the instructor and the Graders to focus on more valuable
activities like answering student questions and providing feedback.  The automation is enabled by conventions and
tools that standardize the structure of projects (using Maven) and the process for submitting the projects.

Projects are submitted using the `submit.sh` script.  Project code is not submitted through Canvas or by emailing the
instructor.  This script invokes a Java program that zips up the source code and emails it to the Grader.  Like the
`survey.sh` script, it can only be run on the PSU MCECS Linux machines.  This script also builds the project using
`mvn -Dgrader clean verify` to validate that the code that you are about to submit compiles, the tests succeed, and
that the tests provide sufficient code coverage.  Make sure that all of your code compiles before you submit it.
The Grader will not to attempt to debug your code.  Your grade will be reduced significantly if your code does not
compile and the Grader has to read it.

Additionally, please remove any debugging or "println" output from your program 
before you submit it.  Such output can be very helpful during development, but can complicate the job of the Grader who
has to wade through extra text to identify the intended output of your program.  The Grader reserves the right to deduct
points from projects whose output is difficult to interpret.  You are encouraged to write unit tests to reproduce and 
validate defects discovered during development.  If you choose to include debugging statements, they should be enbled 
by a Java system property. 

The `submit.sh` script takes one argument, the name of the Project to submit.  The Project name (number) will determine
the directory that contains the project's code.  For instance, you can submit Project 1 by running the following command
from the top-level directory of your git repository clone:

```shell
$ ./submit.sh Project1
```

You will be prompted to confirm the files that you want to submit.

You will also be asked to provide a rough estimate of the number of hours you spent working on the project.  This 
optional information will be recorded and reported to future students in aggregate to give them an idea of how much
time they should plan to spend on projects.  The estimated hours you report will have no bearing on your grade.      

The script may take a moment or two to zip the source files and email them to the Grader.   You will receive a
receipt email telling you which files were sent.

Some additional notes:

  * Only source files can be submitted.  You can submit `.java`, `.xml`, and `.txt` files beneath the `src` directory of your Maven project.
    * Yes, your README can be loaded from a text file in `src/main/resources`.
    * No, you can't submit a modified `pom.xml`.  So, you can't add dependencies (like third-party libraries that do command line parsing).
  * Multiple submissions before the due date are allowed, but only your most recent submission will be graded. Remember that there are a lot of you and the Grader has to un-jar each of your submissions. You don't want to waste the grader's time with superfluous submissions.  The active word in "grader" is "GRADE".
  * No late work will be accepted.  Each submission has a time stamp on it, so we know if you're late.

If your project has missing functionality or if there is anything you'd like the Grader to know about your project, the
`submit.sh` script supports an addition second argument that records a comment for your submission. 

```shell
$ ./submit.sh Project1 "I did not have time to get one-digit hours working"
```

After your code has been successfully submitted, the `submit.sh` script will
[tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) the current revision of 
your git repository. The name of the tag indicates which project was submitted and
the date/time it was submitted.  For example, submitting Project1 at 9 AM on May 1st
would tag the current revision of the repository with `submit-Project1-20250117T09:00:58`.
This tag allows you to create a [branch](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)
from the specific revision of your code that was submitted, which makes debugging problems
in submitted code much easier.  Note that the `submit.sh` will issue an error if there are
uncommitted changes in your local clone of the repository.  So, be sure to commit all of
your changes before submitting.  Additionally, the `submit.sh` script will check to see if there are any changes
in the remote `origin` repository that you have not pulled into your local clone.  If there are, the script will issue
an error message and request that you perform a `git pull` to get the latest changes from the remote repository.  This
ensures that you are submitting the most recent version of your code.

Once the `submit.sh` has completed, and the tag for the repository has been created, the tag will need to be pushed to the remote repository (your Github repository). 

Push all tags:
```shell
$ git push --tags
```

Or push an individual tag:
```shell
$ git push origin submit-Project1-20250117T09:00:58
```

To fix a bug in submitted code, create a new branch of your repository from the `submit` tag on your development system:
```shell
$ git fetch    # Fetch the tag(s) from GitHub ("origin") into your local clone 
$ git checkout -b fix-Project1 submit-Project1-20250117T09:00:58   # Create a branch to make fixes
$ git push --set-upstream origin fix-Project1    # Push the branch to GitHub
# Make code changes, commit them to git, and push them to the fix-Project1 branch
```

When you're ready to resubmit, check out the bugfix branch on the PSU machine:
```shell
$ git fetch   # Fetch the branch from GitHub ("origin")
$ git checkout -b fix-Project1 origin/fix-Project1   # Create a new branch on PSU machine
```

After submitting, check out the `main` branch to resume work on the next project:
```shell
$ git checkout main
```

### About how long do the projects take to complete?

Starting in the Winter of 2022, we started gathering data from students
regarding the approximate number of hours they spend working on each project.
Note that there are not as many submissions for the XML project because it only
applies to the 11-week version of the course, which is not offered in the Summer.
The following is a summary of the data gathered to date.  

|            | App Classes | Text File | Pretty Print |     Koans |      XML |      REST |  Android |
|:-----------|------------:|----------:|-------------:|----------:|---------:|----------:|---------:|
| Count      |         142 |       142 |          138 |       122 |       80 |       129 |      130 |
| Average    |    21 hours |  20 hours |     23 hours |  19 hours | 24 hours |  30 hours | 26 hours |
| Maximum    |    60 hours | 120 hours |     76 hours | 100 hours | 60 hours | 129 hours | 90 hours |
| Top 25%    |    25 hours |  25 hours |     30 hours |  23 hours | 30 hours |  40 hours | 30 hours |
| Median     |    20 hours |  20 hours |     20 hours |  16 hours | 20 hours |  25 hours | 24 hours |
| Bottom 25% |    12 hours |  12 hours |     12 hours |  10 hours | 15 hours |  16 hours | 17 hours |
| Minimum    |     3 hours |   0 hours |      2 hours |   4 hours |  6 hours |   7 hours |  5 hours |

You may want to consider it as you plan your projects.  Recall, though, that
this data is self-reported.  Your experience might be different from that
of previous students.

## How do I use the "parent POM"?

This repository includes a "parent" [pom.xml](pom.xml) file.  You'll
need to edit the `pom.xml` file to include your user id and GitHub
username.  As you create projects (such as Project 1), they will be
added as sub-modules to the parent POM.

Having a parent project (POM) for all of your projects is convenient
because it lets you build all of your code in one invocation of Maven.
While this is not strictly necessary, it does enable easy integration
with continuous integration tools.  This repository is configured to use
a [GitHub workflow to automatically build the project](.github/workflows/maven.yml)
(including running tests) whenever a change is pushed to the `main` branch.

The parent project also allows you to create a multi-module [Maven
site](https://maven.apache.org/guides/mini/guide-site.html) for all of
your projects.

### What's the deal with warnings about an incorrect parent POM?

As you create Maven projects in this repository, you may encounter warnings like this when running `mvnw`:

```
[WARNING] 
[WARNING] Some problems were encountered while building the effective model for edu.pdx.cs.joy.whitlock:apptbook:jar:1.0.0
[WARNING] 'parent.relativePath' of POM edu.pdx.cs.joy.whitlock:apptbook:1.0.0 (JoyOfCodingSummer2025/apptbook/pom.xml) points at edu.pdx.cs.joy.whitlock:JoyOfCodingSummer2025 instead of io.github.davidwhitlock.joy:joy, please verify your project structure @ line 3, column 11
[WARNING] 
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING] 
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
[WARNING] 
```

This is a side effect of the Maven projects that are created by the scripts and the archetypes they are created from.

These warning are not problematic, and you do **not** need to do anything about them.  However, they are annoying.

In order to remove them, you'll need to adjust the `<parent>` section of the `pom.xml` file in your projects.  
When created, the `pom.xml` files for the projects specify a parent of _my_ top-level POM, something like

```xml
  <parent>
    <artifactId>joy</artifactId>
    <groupId>io.github.davidwhitlock.joy</groupId>
    <version>1.2.2</version>
  </parent>
```

To remove this warning, you'll want to change the parent of the assignment's POM to _your_ top-level POM (whose *parent*
is my top-level POM) to something like:

```xml
  <parent>
    <artifactId>JoyOfCoding</artifactId>
    <groupId>edu.pdx.cs.joy.your-mcecs-user-id</groupId>
    <version>1.0.0</version>
  </parent>
```

Note that you should only make this change to the `pom.xml` files for the projects that you create (like `koans`).  
The `<parent>` of the top-level `pom.xml` should still refer to my `joy` POM.  This allows you to inherit Maven
plugin settings that are necessary for the course assignments.

## How can I use a debugger to uncover the source of problems with my projects?

Test-driven development encourages you to write code in small increments and provides you with a suite of tests that
validate that your code still works as expected as you make changes.  However, sometimes a test will fail or the
command line program will not behave as expected for reasons that aren't clear.  In these situations, a debugger
may provide insight that allows you to resolve issues with your code.  Running the Java Virtual Machine
(the `java` command line tool) with the appropriate options enables a debugger client (such as IntelliJ) to connect
to the Virtual Machine.  In turn, this enables the developer to set breakpoints to pause program execution and
inspect data/objects of running programs.  While using a debugger may take some getting used to, it is far faster
and more powerful than sprinkling `println`s all over your code!

IntelliJ offers some [very powerful features](https://www.jetbrains.com/help/idea/debugging-your-first-java-application.html)
for debugging Java programs and has great support for running tests and `main` programs under a debugger.

However, if you are executing Java programs from the command line (either running your `main` program directly or
running automated tests using maven), you must configure the JVM to allow [IntelliJ to
attach](https://www.jetbrains.com/help/idea/tutorial-remote-debug.html) to the "remote" Java process.

In order to debug code running as an executable jar, you must specify the `-agentlib` option to the JVM in addition
to the `-jar` option:

```
java "-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005" -jar target/student-1.0.0.jar 
```

The above `-agentlib` option causes the JVM to output a (rather cryptic) informational message indicating that the JVM
is listening on port `5005` for a debugger (such as IntelliJ) to attach.

```
Listening for transport dt_socket at address: 5005
```

For command line programs, it is important that the `suspend` configuration property have a value of `y`.  This
instructs the JVM to not execute the `main` method _until_ a debugger has attached.  When the value of `suspend` is
`n`, the program will begin execution and will likely complete before a debugger has attached. 

Maven is a program written in Java that builds Java projects.  When the `mvnw` script is run, it runs Maven using a
Java Virtual Machine.  If you want to attach a debugger to a Maven build that, say, has failing unit tests, you
don't add the `-agentlib` option to the `mvnw` command line.  Instead, you specify the `-agentlib` option in the
`MAVEN_OPTS` environment variable.  

```shell
# On UNIX
export MAVEN_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005"
```

```shell
# In a Windows PowerShell environment 
$Env:MAVEN_OPTS = '-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005'
```

```shell
REM In a Windows command environment 
set MAVEN_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005
```

The `mvnw` script includes the value of `MAVEN_OPTS` when it assembles the `java` command line that ultimately runs
Maven.

When enabling Maven to be debugged, you may want to consider using `suspend=n`.  You'll likely have time to connect a
debugger to the Maven process before the code you want to debug (unit/integration tests) is invoked by the Maven build.
In particular, you'll probably want to use `suspend=n` when Maven is used to run the Jetty web server in the REST
project. 

## How can I create a website for the projects in this repository?

Running `mvn site` from the root directory of this repository will
generate a website that provides lots of information (reports, etc.) 
about the Maven projects.  Note that in order for your multi-project
Maven site to generate correctly, the subprojects must specify that
their parent project is the `JoyOfCodingSummer2025` project in
your group:

```xml
  <parent>
    <artifactId>JoyOfCoding</artifactId>
    <groupId>edu.pdx.cs.joy.your-mcecs-user-id</groupId>
    <version>1.0.0</version>
  </parent>
```

[GitHub Pages](https://guides.github.com/features/pages/) are web
pages that are hosted by GitHub and can easily be published via
GitHub.  You can post the website for your Maven projects by first
creating a `gh-pages` branch (from the initial revision of the 
repository), removing the `README.md` file on that branch (because
it will take precedence over the generated `index.html` file) and
pushing it to GitHub:

```
$ git branch gh-pages
$ git checkout gh-pages
$ git rm README.md
$ git commit -m "Remove README.md on gh-pages branch" README.md
$ git push --set-upstream origin gh-pages
$ git checkout main
```

Then, you can generate and publish your website using the below
commands.  Note that before you can do this, you must replace
instances of `YourGitHubUser` with your GitHub username in the
top-level (parent) `pom.xml` file.

```
$ ./mvnw site
$ ./mvnw site:stage                  # Gathers site files across multiple projects
$ ./mvnw scm-publish:publish-scm     # Uploads to GitHub
```

You can open `target/staging/index.html` in your web browse to see
what your site will look like.

Verify that your website is available at a URL like:
https://yourgithubuser.github.io/JoyOfCodingSummer2025

## How can I improve this repository?

This repository is kind of thrown together, and it ought to evolve to
meet the needs of the students who take The Joy of Coding.  

Feel free to [create issues](../../issues) for this repository if you find
something missing or confusing.

It's even better, though, when someone contributes their own changes
(add new scripts, augment documentation, fix type-os, etc.), to this
repository.  Please make a (public)
[fork](https://help.github.com/en/articles/fork-a-repo) of this
repository in GitHub, make your changes in a branch of that
repository, and [create a pull
request](https://help.github.com/en/articles/creating-a-pull-request-from-a-fork)
against this repository.  We can then have a discussion about your
changes via GitHub.
