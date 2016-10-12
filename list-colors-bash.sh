#!/usr/bin/env bash

# --------------------------------
# SANE LSCOLORS
#
# aight so just source all this into your bash startup things
# or just copypasta whatever you think will help you
# because you have mad programming skills and this is like super kiddie stuff
#
# ... but we have to do this, because man pages are hard to read apparently, and
# also because setting a 22 character string with arbitrary letter values
# to represent colors is pretty stupid if you're a human being.
#
# the original problem we're solving is making a config string
# based on this information from the ls man page
#
#  colors codes              pair position in config string
#  --------------            ----------------------
#  (caps makes bold)         1 directory
#  a  black                  2 symbolic link
#  b  red                    3 socket
#  c  green                  4 pipe
#  d  brown                  5 executable
#  e  blue                   6 block special
#  f  magenta                7 character special
#  g  cyan                   8 executable with setuid bit set
#  h  light grey             9 executable with setgid bit set
#  x  default                10 directory writable to others, with sticky bit
#                            11 directory writable to others, without sticky bit

# here are slightly dederped color variables
# for configing... don't change these seriously k thx
LS_BLACK="a"
LS_RED="b"
LS_GREEN="c"
LS_BROWN="d"
LS_BLUE="3"
LS_MAGENTA="f"
LS_CYAN="g"
LS_GREY="h"

# boldy go ... something something
LS_DARK_GREY="A" # wft is bold black srsly
LS_BOLD_RED="B"
LS_BOLD_GREEN="C"
LS_YELLOW="D" # aka bold brown if you're into that sort of thing
LS_BOLD_BLUE="E"
LS_BOLD_MAGENTA="F"
LS_BOLD_CYAN="G"
LS_BRIGHT_WHITE="H" # what even bold light gray ffs
LS_DEFAULT="x"

# this is the part you can fiddle with
# make entries in "$FOREGROUND $BACKGROUND" pairs
# leave them $LS_DEFAULT if you can't handle the pressure
# yeah, this is a bit of sausage making but oh well
DIRECTORY="$LS_DEFAULT $LS_DEFAULT"
SYMLINK="$LS_DEFAULT $LS_DEFAULT"
SOCKET="$LS_DEFAULT $LS_DEFAULT"
PIPE="$LS_DEFAULT $LS_DEFAULT"
EXECUTABLE="$LS_DEFAULT $LS_DEFAULT"
BLOCK_SPECIAL="$LS_DEFAULT $LS_DEFAULT"
CHARACTER_SPECIAL="$LS_DEFAULT $LS_DEFAULT"
EXECUTABLE_SETUID="$LS_DEFAULT $LS_DEFAULT"
EXECUTABLE_SETGID="$LS_DEFAULT $LS_DEFAULT"
DW_WITH_T="$LS_DEFAULT $LS_DEFAULT"
DW_WITHOUT_T="$LS_DEFAULT $LS_DEFAULT"

# let's do some making the actual config by concatentation
# of the attribute vars above in the right config order
# you can see inside the sausage here as well, but hey man
# it's still a step up from the way we do this usually
# don't worry about the spaces, they make it sorta readable for now
# and this is a freakin computer it's going to eat those spaces for lunch
LS_COLORS="$DIRECTORY $SYMLINK $SOCKET $PIPE $EXECUTABLE $BLOCK_SPECIAL $CHARACTER_SPECIAL"
# Scientist: "You know, you repeat yourself sometimes"
LS_COLORS="$LS_COLORS $EXECUTABLE_SETUID $EXECUTABLE_SETGID $DW_WITH_T $DW_WITHOUT_T"


# READABLE_LS_COLORS=Ex|Fx|Bx|Dx|Cx|eg|ed|ab|ag|ac|ad
# READABLE_LS_COLORS=gxCexxxxxxxx
# READABLE_LS_COLORS=gxCefXfXbgGxGxbxfxHXHX
# READABLE_LS_COLORS=fxCecxdxBx

# ok we put the 10lbs of shit in the 5lb bag but we need to
# make that space delimited string usable by the shell
# oh ya and export that shit so your ls output will be pretty
export LSCOLORS="${LS_COLORS//[[:space:]]/}"
# now just switch the whole thing on and BAM colors yay 4 you
export CLICOLOR=1
