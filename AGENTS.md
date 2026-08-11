# The Joy of Coding: Agent Instructions

This repository supports a Java and Android software-development course.
Prioritize learning, clear communication, and small, student-understandable
changes over completing work quickly.

## Academic integrity and scope

- Do not assist with quizzes or exams. They must be completed without Gen AI,
  online resources, or other reference materials.
- The multi-phase course project is individual work. Do not retrieve, inspect,
  compare, copy, or combine another student's project code.
- Pair and mob programming are limited to the designated in-class katas. Kata
  repositories may be public; individual project repositories must remain
  private.
- Help a student understand requirements, diagnose a problem, design a small
  change, or review code they have written. Do not generate a complete
  assignment solution or make broad, solution-sized changes from a starter
  repository.
- Before implementing a nontrivial change, explain the approach and let the
  student retain ownership of the decision. Encourage the student to be able
  to explain each submitted change in their own words.

## Java and Android

- Write idiomatic, straightforward Java that matches the concepts already used
  by the assignment. Avoid unnecessary frameworks, code generation,
  reflection, and advanced patterns.
- The course uses Java for Android work. Acknowledge Kotlin when relevant, but
  do not introduce Kotlin unless the assignment explicitly requires it.
- Follow the Google Java Style Guide. Use clear names, conventional package and
  class organization, and readable control flow. Do not use wildcard imports.
- Preserve assignment-specified packages, public APIs, command-line switches,
  and starter-code structure.
- Do not modify Maven project dependencies in the pom.xml.  In particular, do
  not add third-party libraries like Spring or Apache Commons.  Students should
  leverage JDK APIs for command line parse, file writing/reading, etc.

## Design and documentation

- Begin each project with a concise, plain-text plan of attack: two to four
  paragraphs describing the design and implementation approach, not code.
- Add Javadoc for every application class and method written for the project.
  Describe behavior, and use `@param`, `@return`, and `@throws` where
  appropriate. Test code does not require API documentation.
- If an assignment specifies a `-README` switch, it must print a brief,
  formatted description that names the student and assignment, not merely
  command usage. It must do no other work or error checking. If implemented
  from a file, load that file as a Java resource rather than through a
  relative runtime path.

## Testing and validation

- Write and maintain both unit and integration tests. Exercise every class
  written for the project and aim for at least 75% instruction coverage.
- For Maven projects with the course grader profile, validate with
  `./mvnw -Pgrader clean verify`. Do not delete, weaken, skip, or alter tests
  merely to make a build pass.
- Use `InvokeMainTestCase`-style integration tests for command-line programs:
  supply `main` arguments and verify captured standard output and standard
  error.
- Do not put mutable non-`final` static fields in a class that contains
  `main`; integration tests may invoke `main` repeatedly in one JVM. Do not
  call `System.exit` from project code exercised by tests.
- When coverage needs investigation, inspect
  `target/site/jacoco/index.html` after the grader build.

## Collaboration and submission

- Keep commits small, meaningful, and authored by the student. Do not treat a
  GitHub push as a submission; use the course-provided `submit.sh` process
  when an assignment requires submission.
- When helping debug, ask for the command run, complete error text, observed
  behavior, and expected behavior. Prefer explaining how to investigate over
  guessing.
