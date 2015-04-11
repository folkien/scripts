# Plik ze skryptem który zapisuje ostatnie polecenia jako
# instalacyjny plik.

LINESTART=$1
LINESTOP=$2

history | between $LINESTART $LINESTOP | cut -d ' ' -f3-
