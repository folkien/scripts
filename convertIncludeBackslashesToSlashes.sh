#!/bin/bash
echo "Conversion started..."
for f in *.cpp; do perl -i.bak -pe 'tr!\\!/! if /^\s*#\s*include\b/' $f; done
for f in *.c; do perl -i.bak -pe 'tr!\\!/! if /^\s*#\s*include\b/' $f; done
for f in *.h; do perl -i.bak -pe 'tr!\\!/! if /^\s*#\s*include\b/' $f; done
for f in *.hh; do perl -i.bak -pe 'tr!\\!/! if /^\s*#\s*include\b/' $f; done
echo "Conversion done."
