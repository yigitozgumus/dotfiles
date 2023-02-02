#!/bin/bash
./gradlew -Pdependency.analysis.autoapply=true "$1":projectHealth "${@:2}"
