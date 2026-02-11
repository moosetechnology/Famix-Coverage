[![Moose version](https://img.shields.io/badge/Moose-12-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)
[![Moose version](https://img.shields.io/badge/Moose-13-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)
![Build Info](https://github.com/moosetechnology/Famix-Coverage/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/moosetechnology/Famix-Coverage/badge.svg?branch=main)](https://coveralls.io/github/moosetechnology/Famix-Coverage?branch=main)

# Famix-Coverage

Represents code coverage using a Famix model of the code.

## Installation

```st
Metacello new
  githubUser: 'moosetechnology' project: 'Famix-Coverage' commitish: 'main' path: 'src';
  baseline: 'FamixCoverage';
  load
```
