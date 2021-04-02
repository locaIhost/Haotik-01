#!/usr/bin/perl -w
####################################
#	BSD 3-Clause License
#Copyright (c) 2021, M.Konstantinovna
#All rights reserved.
#####################################
use strict;
use warnings;

sub menu()
{
	my ( $msg ) = <<'H';
			
	            _|_
	             | 		 
	             |
	            )6(
	            |☦|
	       ☦  _+|_|+_  ☦
	      )6( |:|:|:| )6(
	      | |_||H|H||_| |
	 ,    | |:|:|:|:|:| |    ,
	)X(_+_| ||H|A|X|A|| |_+_)H(
	|P| | |	H A O T I K | | |A|
	|E|:|:| |:|:|:|:|:| |:|:|O|
	|R||H|| ||A|O|T|I|| ||K||T|
	|L|:|:| |:|:|:|:|:| |:|:|I|
	|_||H||_||H|===|H||_||H||K|
	^^"     ~^^/  /^^~      "^^~
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	You summoning Haotik!
	   what do u need?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. Show INT
2. Show IP 
3. Show LOG
4. Check beep
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
H
my ( $msg0, $msg1,	# interactive.
	 $msg2, $msg3,	  # Interactive.
	 $msg4, $msg5,	  # Reserved.
	 $msg6, $msg7,	  # Reserved.
	 $msg8, $msg9,	  # Reserved.
	 $msg_clear,	    # Screen and terminal clear.
	 $msg_space,	    # Multiline symbol null  " " for Menu.
	 $msg_tilda, 	    # Multiline symbol tilda "~" for Menu.
	 $msg_caret,	    # Multiline symbol caret "^" for Menu.
	 $msg_bye		      # QA procedure Drop.
	);

( $msg_clear ) = qq([2J\033[H\033[J);
( $msg_space ) = q( ) x 13;
( $msg_tilda ) = q(~) x 46;
( $msg_caret ) = q(^) x 46;
( $msg_bye )  = q(Bye! ) x 10000; 
( $msg0 ) = qq(\nSend me number: => );
( $msg1 ) = qq($msg_clear$msg_tilda\n\e[1;5;35m$msg_space SELECTED I\e[0m\n$msg_tilda);
( $msg2 ) = qq($msg_clear$msg_tilda\n\e[1;5;31m$msg_space SELECTED II\e[0m\n$msg_tilda);
( $msg3 ) = qq($msg_clear$msg_tilda\n\e[1;5;31m$msg_space SELECTED III\e[0m\n$msg_tilda);

print $msg;
while (1)
	{
	print $msg0;
	my $query = <<>>;
	chomp($query);
	#	Separation selected menu.
		if ($query eq "1")
		{
			printf($msg1);
		}
		elsif ($query eq "2")
		{
			printf($msg2);
		}
		elsif ($query eq "3")
		{
			printf($msg3);
		}
		else 
		{
			print($msg_bye),
			exit;
		}

	}
};

&menu



__END__
