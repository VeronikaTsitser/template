#!/bin/bash

dart pub global activate fvm
dart pub global activate intl_utils
fvm install
fvm flutter precache
bash scripts/create_project.sh
bash scripts/prebuild.sh
