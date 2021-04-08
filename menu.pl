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
1. Show interface.
2. Show ip address.
3. Show log.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
4. Check beep.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
5. Configure Mikrotik.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
H

	my ( $menu ) = <<'A';
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. Show interface.
2. Show ip address.
3. Show log.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
4. Check beep.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
5. Configure Mikrotik!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
A


my ( $msg0, $msg1,	# interactive.
	 $msg2, $msg3,	# Interactive.
	 $msg4, $msg5,	# Reserved.
	 $msg6, $msg7,	# Reserved.
	 $msg8, $msg9,	# Reserved.
	 $msg_clear,	# Screen and terminal clear.
	 $msg_space,	# Multiline symbol null  " " for Menu.
	 $msg_tilda, 	# Multiline symbol tilda "~" for Menu.
	 $msg_caret,	# Multiline symbol caret "^" for Menu.
	 $msg_exc,		# Multiline symbol exclamation "!" for Menu.
	 $msg_bye		# Drop
	);

( $msg_clear ) = qq([2J\033[H\033[J);
( $msg_space ) = q( ) x 13;
( $msg_tilda ) = q(~) x 46;
( $msg_caret ) = q(^) x 46;
( $msg_exc	 ) = q(+!) x 23;
( $msg_bye )  = q(Bye! ) x 10000; 
( $msg0 ) = qq(\nSend me number: => );
( $msg1 ) = qq($msg_clear$msg_tilda\n\e[1;5;35m$msg_space SELECTED I\e[0m\n$msg_tilda);
( $msg2 ) = qq($msg_clear$msg_tilda\n\e[1;5;31m$msg_space SELECTED II\e[0m\n$msg_tilda);
( $msg3 ) = qq($msg_clear$msg_tilda\n\e[1;5;31m$msg_space SELECTED III\e[0m\n$msg_tilda);
( $msg4 ) = qq($msg_clear$msg_tilda\n\e[1;5;31m$msg_space SELECTED IV\e[0m\n$msg_tilda);
( $msg5 ) = qq($msg_clear$msg_tilda\n\e[1;5;31m$msg_space SELECTED V\e[0m\n$msg_tilda);

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
		elsif ($query eq "4")
		{
			printf($msg4);
			&ssh_beep,
			printf($msg_clear),
			printf($menu);
		}
		elsif ($query eq "5")
		{
			printf($msg5);
			&config_menu;
		}
		else 
		{
			print($msg_bye),
			exit;
		}

	}
};



sub ssh_beep
{
	use Net::OpenSSH;
	my ( $name, $addr, $pass, $off, $beep, $get );
	( $name ) = qq(YOU_LOGIN);
	( $addr ) = qq(YOU_IP);
	( $pass ) = "YOU_PASS";
	( $off ) = int(7);
	( $get ) = Net::OpenSSH->new
	(
    $addr,
    user        => $name,
    password    => $pass,
    timeout     => $off,
    master_opts => [ -o => "StrictHostKeyChecking=no" ]
	);
	( $beep ) = ("beep frequency=10101 length=0.1");
	( $get )->capture( $beep ) or die "I want c0ff33";

};

sub config_menu
{
my ( $msg0 ) = qq(\nSend me number: => );
my ( $dead ) = qq(\nY0u selected invalid number: );
my ( $msg_clear ) = qq([2J\033[H\033[J);
my ( $menu_config ) = <<'X';
1. Configure ip address.
+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!
0. Return menu.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X

printf("\n".$menu_config);
while (1)
	{
	print $msg0;
	my $query = <<>>;
	chomp($query);
	if ($query eq "1")
		{
			printf($msg_clear);
			&show_ip;
			&config_ip;
		} 
	elsif ($query eq "0")
		{
			return &menu;
		} 
	else
		{
			return &menu;
		}
	}
};

sub show_ip 
{
	use Net::OpenSSH;
	my ( $name, $addr, $pass, $off, $sh_ip, $get );
	( $name ) = qq(YOU_LOGIN);
	( $addr ) = qq(YOU_IP);
	( $pass ) = "YOU_PASS";
	( $off ) = int(7);
	( $get ) = Net::OpenSSH->new
	(
    $addr,
    user        => $name,
    password    => $pass,
    timeout     => $off,
    master_opts => [ -o => "StrictHostKeyChecking=no" ]
	);
	(  $sh_ip ) = ("ip address print brief");
	my $anchor  = ( $get )->capture( $sh_ip ); printf($anchor)
	or die "I want c0ff33 and sub show_ip";

};

sub config_ip
{
my ( $msg0 ) = qq(\nSend me number: => );
my ( $msg1 ) = qq(\nSend me ip address: => );
my ( $msg2 ) = qq(Send me interface:  => );
my ( $msg_tilda ) = q(~) x 46;
my ( $msg_tipa ) = ($msg_tilda.$msg1);
my ( $menu_config_1 ) = <<'configure_ip';
+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!
1. Add ip address.
0. Return configure menu.
+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!+!
configure_ip
printf($menu_config_1);
while (1) 
	{
		printf($msg0),
		chomp( my $query = <<>> );
		if ($query eq "1") 
		{
			#use Net::OpenSSH;
			printf($msg_tipa),
			chomp( my $address = <<>> );
			printf($msg2),
			chomp( my $interface = <<>> );
			printf("\nip address add address=$address interface=$interface\n".$msg_tilda."\n");
			exit;

		}
		elsif ($query eq "0")
		{
			&config_menu;
		}

	}


};



&menu


__END__