#!/usr/bin/env perl
my $lW = 7;
my $lCmd = "{ sleep " . $lW . "; echo \"slept for " . $lW . " seconds.\"; }";
system( $lCmd );
