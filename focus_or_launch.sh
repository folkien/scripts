 #!/bin/bash

# NAME:         focus_or_launch
# VERSION:      0.4
# AUTHOR:       (c) 2014 Glutanimate <https://github.com/Glutanimate/>
#
# DESCRIPTION:  Focus existing app window or launch application if no
#               window found
#
#               Simplified version of a script by Henning Bekel
#               (https://bbs.archlinux.org/viewtopic.php?pid=625009#p625009)
#
# DEPENDENCIES: xdotool
#
# LICENSE:      GNU GPLv3 (http://www.gnu.de/documents/gpl-3.0.en.html)
#
# NOTICE:       THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. 
#               EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES 
#               PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR 
#               IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY 
#               AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND 
#               PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE,
#               YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
#
#               IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY 
#               COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS 
#               PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, 
#               INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE 
#               THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED 
#               INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE 
#               PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER 
#               PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
#
# USAGE:        focus_or_launch <command>
# EXAMPLE:      focus_or_launch google-chrome


############# GLOBVAR/PREP ###############

Executable="$1"
ExecutableBase="$(basename "$Executable")"
Usage="\
Usage: $(basename $0) command
E.g.:  $(basename $0) google-chrome\
"

############## USGCHECKS #################

if [[ $# -ne 1 || "$1" =~ ^(-h|--help)$ ]]; then
  echo "$Usage"
  exit 1
fi

################ MAIN ####################

MostRecentWID="$(xdotool search --class --name "$ExecutableBase" | tail -1 2> /dev/null)"

if [[ -z "$MostRecentWID" ]]; then
  echo "$ExecutableBase not found. Launching new window."
  "$Executable" > /dev/null 2>&1 &
  disown
else
  echo "Focusing existing instance of $ExecutableBase."
  # use brute-force approach if activating most recent WID doesn't work
  xdotool windowactivate "$MostRecentWID" 2>&1 | grep failed \
  && xdotool search --class --name "$ExecutableBase" windowactivate %@
fi
