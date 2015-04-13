#!/bin/bash
#kopiowanie z progressem, wymaga zainstalowanego rsync'a
rsync --progress -a $1 $2
