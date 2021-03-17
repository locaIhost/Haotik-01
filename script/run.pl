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
use warnings;
#####################################
#Scalar data for connect	=<1>=~
#####################################
my ( $anchor, $name, $addr, $pass, $tiot );
#####################################
#Config yOu net data		=<2>=~
#####################################
( $name ) = qq(YOU_NAME);
( $addr ) = qq(10.101.10.101);
( $pass ) = "YOUR_PASSWORD";
( $tiot ) = int(7);
#####################################
#Link scalar for connect	=<3>=~
#####################################
my ( $get ) = Net::OpenSSH->new(
    $addr,
    user        => $name,
    password    => $pass,
    timeout     => $tiot,
    master_opts => [ -o => "StrictHostKeyChecking=no" ]
	);
#####################################
#Scalar data for Mikrotik	=<4>=~
#####################################
my ($beep) = ("beep frequency=35 length=0.1");
#####################################
#Run!	=<5>=~
#####################################
($get)->capture($beep) or die "I want c0ff33";

__END__
