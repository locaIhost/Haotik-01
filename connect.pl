
#!/usr/bin/perl -w
####################################
#	BSD 3-Clause License
#Copyright (c) 2021, M.Konstantinovna
#	All rights reserved.
#####################################
#Default ssh connect on perl!
#
##/***********************************  
#*              _|_
#*               |
#*              )6(
#*              | |
#*         ,  _+|_|+_  ,
#*        )6( |:|:|:| )6(
#*        | |_||H|H||_| |
#*   ,    | |:|:|:|:|:| |    ,
#*  )X(_+_| ||H|H|H|H|| |_+_)P(
#*  | |:|:| |:|:|:|:|:| |:|:| |
#*  | ||H|| ||H|H|H|H|| ||H|| |
#*  | |:|:| |:|:|:|:|:| |:|:| |
#*  |_||H||_||H|===|H||_||H||_|
#* ^^"      ~^^/   \^^~      "^^~               
#*    	  |__|/\ \_/ /\  
#*    	  |  /~~\/ \/~~\ 
#*haxa                   
#*12.03.2021
#####################################
use Net::OpenSSH;
use strict;
#####################################
#Scalar data for connect	=<1>=~
#####################################
my ( $name, $addr, $pass, $off, $beep );
#####################################
#Config yOu net data		  =<2>=~
#####################################
( $name ) = qq(YOU_NAME);
( $addr ) = qq(10.101.10.101);
( $pass ) = "YOUR_PASSWORD";
( $off ) = int(7);
#####################################
#Sub for connect and send beep =<3>~
#####################################
sub connect_ssh 
{
	my ( $get ) = Net::OpenSSH->new
	(
    $addr,
    user        => $name,
    password    => $pass,
    timeout     => $off,
    master_opts => [ -o => "StrictHostKeyChecking=no" ]
	);
	( $beep ) = ("beep frequency=35 length=0.1");
	( $get )->capture( $beep ) or die "I want c0ff33";
};

&connect_ssh


__END__
