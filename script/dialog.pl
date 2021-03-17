#!/usr/bin/perl -w
####################################
#	BSD 3-Clause License
#Copyright (c) 2021, M.Konstantinovna
#	All rights reserved.
####################################
use strict;
use warnings;

sub dialog {
my($msg) = <<EOF;

              _|_
               |
              )6(
              |☦|
         ☦  _+|_|+_  ☦
        )6( |:|:|:| )6(
        | |_||H|H||_| |
   ,    | |:|:|:|:|:| |    ,
  )X(_+_| ||H|A|X|A|| |_+_)H(
  |P| |	|--- HAOTIK --|	| |A|
  |E|:|:| |:|:|:|:|:| |:|:|O|
  |R||H|| ||A|O|T|I|| ||K||T|
  |L|:|:| |:|:|:|:|:| |:|:|I|
  |_||H||_||H|===|H||_||H||K|
 ^^"      ~^^/  /^^~      "^^~               
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	U summoning Haotik!
	  what do u need?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. show connected
2. show log
3. check self beep
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
EOF
my ( $msg_1 ) = qq(\nSend me number: => );
my ( $msg_2 ) = qq([2J\033[H\033[J);
my ( $msg_3 ) =
q(~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
);




__END__
