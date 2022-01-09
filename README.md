[![Java CI with Maven](https://github.com/YourGitHubId/PortlandStateJavaWinter2022/actions/workflows/maven.yml/badge.svg)](https://github.com/YourGitHubId/PortlandStateJavaWinter2022/actions/workflows/maven.yml)

# Getting Started with Advanced Programming with Java

This repository helps students in [Advanced Programming with
Java](http://web.cecs.pdx.edu/~whitlock/) get started with the
programming assignments.  Most noteably, it makes it so students do
not need install [Apache Maven](https://maven.apache.org/install.html)
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

## How do I use this repository?

In order to use this repository, you must have a Git environment available on your development machine.
I recommend [intalling
git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) on
your development machine to gain experience with the `git` command line tools (or the [GitHub 
Desktop](https://desktop.github.com/) tools).  If you are not able to get Git working on your development
machine, [IntelliJ has really great support for Git](https://www.jetbrains.com/help/idea/using-git-integration.html)
and makes it easy to perform fundamental clone/commit/push/pull Git operations.  (Note that IntelliJ
does not make it easy to perform the "bare clone" steps described below.  If you're exclusively using IntelliJ
for Git on your development machine, you should perform the "bare clone" steps on the PSU Linux machines to
populate your development Git repository.)

After you have configured Git on your development machine, you need to make a clone of the repository in which
you can do your work.
If you simply make a `git clone` of this GitHub repository on your
local machine, you can commit changes to your local repository, but
you can't "push" your changes to the repository hosted on GitHub.
This is because I own this GitHub repository and you do not have
permission to push changes from your local repository into my
repository.  Even if I did give you permission to push to my
repository, we don't want the source code that you wrote for your
projects to be available publicly for everyone to see.

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
repository is named "PortlandStateJavaWinter2022".)  Note that you do
**not** want to "Initialize this repository with a README".  You want
to create a completely empty repository so that you can initially
populate it from my (this) repository.

Again, please ensure that all of your code for the assignments is in a 
**private** GitHub repository.  GitHub makes it very easy for people to
find your code, and you do **not** want to have your work plagiarized.  
After the course is over, if you want to make your repository public to
help contribute to your coding portfolio, that's fine.  I do ask that 
current students not leverage former students' code to inform their 
projects.  If you have questions about your code that you'd like me to
answer, please feel free to [make me a collaborator](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/managing-access-to-your-personal-repositories/inviting-collaborators-to-a-personal-repository)
on your private repository.  I will try my best to engage you in a 
discussion about  your code.

The below `git` command line examples are expressed using UNIX syntax.  They
are known to work on the CS Department's Linux machines and on MacOS.  Students
who run on Windows may need to use "Git CMD" instead of "Git Bash" to get 
authentication with GitHub to work with HTTPS.

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
$ git push --mirror https://github.com/YourGitHubUser/PortlandStateJavaWinter2022.git
```

If you view your repository on GitHub, you should see the changes
mirrored from my repository.

Now you can delete the bare clone and make a local clone your
repository to work with.

```sh
$ cd ..
$ rm -rf PortlandStateJavaGettingStarted.git
$ git clone https://github.com/YourGitHubUser/PortlandStateJavaWinter2022.git
```

### What do I need to do before I can use this repository?

The following command lines assume that you are running in the
directory created by cloning the repository.

```sh
$ cd PortlandStateJavaWinter2022
```

### How do I use the Java Development Kit?

The Java Development Kit (JDK) provides tools for compiling, packaging, and
running Java applications.  

This course requires at least Java 11.  You can determine which version of Java is configured in your environment
by issuing the `java -version` command:

```sh
$ java -version
openjdk version "16.0.1" 2021-04-20
OpenJDK Runtime Environment (build 16.0.1+9-24)
OpenJDK 64-Bit Server VM (build 16.0.1+9-24, mixed mode, sharing)
```

#### How do I configure the JDK on the PSU Linux machines?

Regardless of where your code is developed, it will be tested on the [MCECS Linux machines](https://cat.pdx.edu/platforms/linux/) 
(the machines in the `linux.cecs.pdx.edu` cluster).  Furthermore, projects can only be submitted
from the PSU Linux machines, so you'll need to make sure that your environment on these machines
is configured to run the right version of Java.

There are a couple of ways to configure your MCECS Linux environment to use the JDK.  The easiest is
to use the `addpkg` command, which provides a graphical user interface for selecting software packages
to add to your execution path.  After launching the `addpkg` command, scroll down and select the `openjdk16`
package, and click "OK".  You may need to log out of the machine and log back in for the changes to take effect.

Alternatively, if you are familiar with configuring the UNIX execution PATH, you can configure the `JAVA_HOME`
environment variable to refer to the directory in which the JDK is installed and then add `$JAVA_HOME/bin` to 
your `PATH` environment variable.  Feel free to consult `/u/whitlock/.bashrc` for examples.

#### How do I install the JDK on my personal machine?

For most of the projects in this course, it is possible (although, not optimal) to develop your code using the
tools on the MCECS Linux machines.  However, it is highly recommended to use your personal desktop or laptop to
leverage tools like IntelliJ to author your projects. 

You'll need to install the [latest version of the Java Development
Kit](https://adoptopenjdk.net/) in order to run the Maven Wrapper and work
with the projects.  (The "HotSpot" JVM should be fine for this course.)  
Windows users should download the "msi" (Microsoft Installer)
binary for an easy installation and configuration process.  During the 
installation process, select "set the JAVA_HOME" environment variable in order
for Maven to work correctly on the command line.

### How do I configure information about myself?

An important initial step in this course it to run the `survey.sh` script.  This script executes a Java program that
asks you some questions about yourself (such as your name, email address, and CECS login id) and saves that
information to a `me.xml` in the directory in which the script is run.  (It also emails the XML file to the Grader
so that the Grader knows who you are, can contact you, and can record your grades.)  The information in this XML file
is used by other scripts in this repository to create the initial files for your projects and for submitting your
projects to the Grader.

Note that the `survey.sh` script **must be executed on one of the PSU CECS Linux machines**.  It cannot be run on your
laptop or local development machine.

From the top-level directory of your, run the `survey.sh` script.  It will ask you to enter some information about
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

### How do I create and run my own Java projects?

The primary purpose of this repository is to make it easy to create
the skeleton Java projects that are used to start your assignment.
Scripts such as `createProject0.sh` will run the appropriate Maven
commands to get you started.  Each of these scripts takes a single
argument which is your MCECS user id.  This one-word user id (mine is
`whitlock`) is used to uniquely identify your code and is included in
the name of the Java package for the project.  (It is important that 
you consistently use this user id in the course.  For instance, please
use your MCECS user id when you run the `survey.sh`script.)

```sh
$ ./createProject0.sh
```

(Note that in this document, I always prefix executables with `./` to
ensure that the executable can be found even if you don't have `.` on
your `PATH`.  Note also that for people who are developing on Windows
machines, there is a `createProject1.cmd` that does the same thing as
the shell script, but doesn't have as nice error checking.  Students
have not been able to get the shell script to work under cygwin.  It
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
$ cd ..            # to PortlandStateJavaWinter2022 directory
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
yourself in this situation, close the IntelliJ project, and delete all
`.iml` files and the `.idea` directory associated with Maven project.

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
$ git clone https://github.com/YourGitHubId/PortlandStateJavaWinter2022.git
```

### How can I get changes that other people make into my clone?

You can expect that the scripts and information in this repository
will change and evolve over time.  You may want these changes in your
repository.  Here's what you need to do to incorporate changes made in
this "upstream" repository into your own repository.

First, configure your repository to have this repository to be a
"remote" named "upstream".

```sh
$ cd PortlandStateJavaWinter2022
$ git remote add upstream https://github.com/DavidWhitlock/PortlandStateJavaGettingStarted.git
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
scripts, and recording grades are automated.  This frees up the instructor and the Graders to focus on more valuable
activities like answering student questions and providing feedback.  The automation is enabled by conventions and
tools that standardize the structure of projects (using Maven) and the process for submitting the projects.

Projects are submitted using the `submit.sh` script.  Project code is not submitted through Canvas or by emailing the
instructor.  This script invokes a Java program that zips up the source code and emails it to the Grader.  Like the
`survey.sh` script, it can only be run on the PSU CECS Linux machines.  This script also builds the project using
`mvn -Dgrader clean verify` to validate that the code that you are about to submit compiles, the tests succeed, and
that the tests provide sufficient code coverage.

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

The script may take a moment or two to zip the source files and email them to the Grader.

## How do I use the "parent POM"?

This repository includes a "parent" [pom.xml](pom.xml) file.  You'll
need to edit the `pom.xml` file to include your user id and GitHub
user name.  As you create projects (such as Project 1), they will be
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
[WARNING] Some problems were encountered while building the effective model for edu.pdx.cs410J.whitlock:airline:jar:2022.0.0
[WARNING] 'parent.relativePath' of POM edu.pdx.cs410J.whitlock:airline:2022.0.0 (PortlandStateJavaWinter2022/airline/pom.xml) points at edu.pdx.cs410J.whitlock:PortlandStateJavaWinter2022 instead of io.github.davidwhitlock.cs410J:cs410j, please verify your project structure @ line 3, column 11
[WARNING] 
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING] 
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
[WARNING] 
```

This is a side effect of the Maven projects that are created by the scripts and the archetypes they are created from.

These warning are not problematic and you do **not** need to do anything about them.  However, they are annoying.

In order to remove them, you'll need to adjust the `<parent>` section of the `pom.xml` file in your projects.  
When created, the `pom.xml` files for the projects specify a parent of _my_ top-level POM, something like

```xml
  <parent>
    <artifactId>cs410j</artifactId>
    <groupId>io.github.davidwhitlock.cs410J</groupId>
    <version>2022.0.0</version>
  </parent>
```

To remove this warning, you'll want to change the parent of the assignment's POM to _your_ top-level POM (whose *parent*
is my top-level POM) to something like:

```xml
  <parent>
    <artifactId>PortlandStateJavaWinter2022</artifactId>
    <groupId>edu.pdx.cs410J.your-mcecs-user-id</groupId>
    <version>2022.0.0</version>
  </parent>
```

Note that you should only make this change to the `pom.xml` files for the projects that you create (like `koans`).  
The `<parent>` of the top-level `pom.xml` should still refer to my `cs410j` POM.  This allows you to inherit Maven
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

```shell
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005 -jar target/student-2022.0.0.jar 
```

The above `-agentlib` option causes the JVM to output a (rather cryptic) informational message indicating that the JVM
is listening on port `5005` for a debugger (such as IntelliJ) to attach.

```shell
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
export MAVEN_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005
```

```shell
REM In Windows command environment 
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
Maven site to generate correctly, the sub-projects must specify that
their parent project is the `PortlandStateJavaWinter2022` project in
your group:

```xml
  <parent>
    <artifactId>PortlandStateJavaWinter2022</artifactId>
    <groupId>edu.pdx.cs410J.your-mcecs-user-id</groupId>
    <version>2022.0.0</version>
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
$ git checkout main
```

Then, you can generate and publish your website using the below
commands.  Note that before you can do this, you must replace
instances of `YourGitHubUser` with your GitHub username in the
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
https://yourgithubuser.github.io/PortlandStateJavaWinter2022

## How can I improve this repository?

This repository is kind of thrown together and it ought to evolve to
meet the needs of the students who take Advanced Programming with
Java.  

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
