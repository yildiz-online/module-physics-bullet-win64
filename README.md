# Yildiz-Engine module-physics-bullet-win64.

This is the official repository of The Bullet Physics Module, part of the Yildiz-Engine project.
The bullet module is an implementation of the module-physics, it is based on the Bullet 2 library.

## Features

* Tri-mesh files loading.
* Rigid bodies.
* Ghost objects.
* ...

## Requirements

To build this module, you will need the latest JDK, Mingw64, Maven and a c++ compiler (mingw).

## Coding Style and other information

Project website:
http://www.yildiz-games.be

Issue tracker:
https://yildiz.atlassian.net

Wiki:
https://yildiz.atlassian.net/wiki

Quality report:
https://sonarqube.com/overview?id=be.yildiz-games:module-physics-bullet-win64

## License

All source code files are licensed under the permissive MIT license
(http://opensource.org/licenses/MIT) unless marked differently in a particular folder/file.

## Build instructions

Go to your root directory, where you POM file is located.

      mvn clean install -Pbuild,common-build

This will compile the source code, then run the unit tests, and finally build a jar file and DLL.

## Usage

In your maven project, add the dependency

```xml
<dependency>
    <groupId>be.yildiz-games</groupId>
    <artifactId>module-physics-bullet</artifactId>
    <version>LATEST</version>
</dependency>
```

## Contact
Owner of this repository: Grégory Van den Borre
