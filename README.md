# Getting Started with Advanced Programming with Java

This repository helps students in Advanced Programming with Java get
started with the programming assignments.  Most noteably, it makes it
so students do not need install [Apache
Maven](https://maven.apache.org/install.html) on their local machines
(or the PSU machines) in order to create and build the programmming
projects.  It makes liberal use of the [Maven
Wrapper](https://github.com/takari/maven-wrapper) script which
automatically downloads and installs the version of Maven needed for
the programming projects..

## How do I use this repository?

After [intalling
git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) on
your local machine, run the following command to make a local clone of
this repository:

```sh
$ git clone git@github.com:DavidWhitlock/PortlandStateJavaGettingStarted.git
```

The following command lines assume that you are running in the
directory created by cloning the repository.

```sh
$ cd PortlandStateJavaGettingStarted
```

### What do I need to do before I can use this repository?

You'll need to install the [latest version of the Java Development
Kit](https://jdk.java.net/) in order to run the Maven Wrapper and work
with the projects.

### How do I create and run my own Java projects?

The primary purpose of this repository is to make it easy to create
the skeleton Java projects that are used to start your assignment.
Scripts such as `createProject0.sh` will run the appropriate Maven
commands to get you started.  Each of these scripts takes a single
argument which is your user id.  This one-word user id (mine is
`whitlock`) is used to uniquely identify your code and is included in
the name of the Java package for the project.

```sh
$ ./createProject0.sh your-user-id
```

This script will generate a new Maven project in a directory named
`student` for [Project
0](http://web.cecs.pdx.edu/~whitlock/pdf/Student.pdf), the example
"Student" project.  You can then build this project using the Maven
Wrapper included in the project.

```sh
$ cd student
$ chmod +x mvnw        # Make the wrapper script executable
$ mvnw verify
```

Note that the first time that you run Maven, it will download a whole
ton of libraries.  You'll see lots of text fly by.

If the build completes successful, you can use your favorite editor (I
highly recommend IntelliJ) to work the project.

### How can I commit my code to this repository?

### How can I push my code up to GitHub?

If you simply make a clone of this repository on your local machine, you can 

### How can I get changes that other people make into my clone?


## How can I improve this repository?

This repository is kind of thrown together and it ought to evolve to
meet the needs of the students who take Advanced Programming with
Java.  

Feel free to [create issues](/issues) for this repository if you find
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
