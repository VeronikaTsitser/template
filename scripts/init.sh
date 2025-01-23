#!/bin/bash

dart pub global activate fvm
fvm install
fvm flutter precache
bash scripts/create_project.sh
bash scripts/prebuild.sh
